; ==============================================================================
; Save / Load Screen
; Params: tf.mode ('save' or 'load')
; ==============================================================================

; ------------------------------------------------------------------------------
; TJS Logic Block
; ------------------------------------------------------------------------------
*start
[iscript]
// Define Layer Indices (Corrected for 0-19 limit)
var sl_bg_layer_id = 9;     // Layer 9
var sl_thumb_start_id = 10; // Layers 10-17
var sl_text_layer_id = 18;  // Layer 18
var sl_hl_layer_id = 19;    // Layer 19

var sl_num_slots = 8;

function sl_drawUI(page, mode) {
    if (page === void) page = 0;
    
    // 0. Ensure Message Layer (Button Container) is at 0,0
    var msgLayer = kag.back.messages[1]; 
    msgLayer.setPos(0, 0);
    msgLayer.setImageSize(1280, 720); 
    msgLayer.setSize(1280, 720);

    // 1. Setup Background Panel (Layer 9)
    var bgLayer = kag.back.layers[sl_bg_layer_id];
    bgLayer.setPos(0, 0);
    bgLayer.setImageSize(1280, 720);
    bgLayer.setSize(1280, 720);
    bgLayer.type = ltAlpha;
    bgLayer.face = dfAlpha;
    bgLayer.fillRect(0, 0, 1280, 720, 0x00000000); // Clear
    // Draw semi-transparent panel RECT (Reduced Opacity)
    bgLayer.fillRect(50, 100, 1180, 550, 0x40000000); 
    bgLayer.face = dfAuto;
    bgLayer.visible = true;

    // 2. Setup Text Layer (Layer 19)
    var textLayer = kag.back.layers[sl_text_layer_id];
    textLayer.setPos(0, 0);
    textLayer.setImageSize(1280, 720);
    textLayer.setSize(1280, 720);
    textLayer.type = ltAlpha; 
    textLayer.face = dfAlpha; 
    textLayer.fillRect(0, 0, 1280, 720, 0x00000000); // Clear transparent
    textLayer.face = dfAuto;  
    textLayer.visible = true;

    // 3. Setup Highlight Layer (Layer 20)
    var hlLayer = kag.back.layers[sl_hl_layer_id];
    hlLayer.setPos(0, 0); 
    hlLayer.type = ltAlpha; 
    hlLayer.setImageSize(1, 1);
    hlLayer.setSize(1, 1);
    hlLayer.fillRect(0, 0, 1, 1, 0x00000000);
    hlLayer.visible = false;
    // Reset Fore Highlight too
    if(kag.fore.layers[sl_hl_layer_id]) {
        kag.fore.layers[sl_hl_layer_id].setPos(0, 0);
        kag.fore.layers[sl_hl_layer_id].visible = false;
    }
    
    // 4. Draw Title
    textLayer.font.height = 48;
    textLayer.font.face = "黑体";
    var titleStr = (mode == "save") ? "存档" : "读档";
    textLayer.drawText(50, 30, titleStr, 0xFFFFFF, 255, true);

    // 5. Draw Tabs (1-10)
    textLayer.font.height = 24;
    for(var i=0; i<10; i++) {
        var tx = 300 + i * 80;
        var ty = 50;
        
        // Draw Text
        textLayer.drawText(tx+10, ty+10, string(i+1), 0xFFFFFF, 255, true);
        
        // Create Button
        kag.tagHandlers.locate(%[x: tx, y: ty]);
        var btn = %[
            graphic: "sys_config_bt_sound_DELETE", 
            exp: "tf.page=" + i,
            target: "*draw_page",
            enterse: "hito_ge_kawaugoki08",
            clickse: "hito_ge_kawaugoki07"
        ];
        kag.tagHandlers.button(btn);

        // HACK: Resize Tab Button
        var msgLayer = kag.back.messages[1]; 
        var lastLink = msgLayer.links[msgLayer.numLinks-1];
        if(lastLink !== void && lastLink.object !== void) {
            var bl = lastLink.object;
            bl.setImageSize(80, 50);
            bl.setSize(80, 50); 
            bl.fillRect(0, 0, 80, 50, 0x01000000); // Almost clear
            bl.opacity = 0; 
        }
    }

    // 6. Draw Slots (8 slots)
    var start = page * sl_num_slots;
    for(var i=0; i<sl_num_slots; i++) {
        var s = start + i;
        var row = (i < 4) ? 0 : 1;
        var col = i % 4;
        
        var x = 100 + col * 280;
        var y = 150 + row * 300;
        
        // Check Data
        var dataDate = kag.bookMarkDates[s];
        var exists = (dataDate != "" && dataDate !== void);
        var existsStr = exists ? "true" : "false";

        // Load Thumbnail
        var thumbLayer = kag.back.layers[sl_thumb_start_id + i];
        thumbLayer.setPos(x, y); 
        thumbLayer.type = ltAlpha; 
        
        var thumbLoaded = false;
        var thumbPath = "savedata/data" + s + ".bmp";
        // Check thumbnail existence
        if(Storages.isExistentStorage(thumbPath)) {
            thumbLayer.loadImages(%[storage:thumbPath]);
            thumbLoaded = true;
        } else {
             var noDataImg = "sys_omake_notfound_data_DELETE";
             if(Storages.isExistentStorage(noDataImg + ".png")) {
                 thumbLayer.loadImages(%[storage:noDataImg + ".png"]);
                 thumbLoaded = true;
             } else if(Storages.isExistentStorage(noDataImg)) {
                 thumbLayer.loadImages(%[storage:noDataImg]);
                 thumbLoaded = true;
             }
        }
        
        if (thumbLoaded) {
            thumbLayer.visible = true;
        } else {
            thumbLayer.visible = false;
        }

        // Draw Text
        textLayer.font.height = 18;
        if (exists) {
            textLayer.drawText(x, y + 140, "Data " + (s + 1), 0xFFDD00, 255, true);
            textLayer.font.height = 16;
            textLayer.drawText(x, y + 165, kag.bookMarkNames[s], 0xFFFFFF, 255, true);
            textLayer.font.height = 14;
            textLayer.drawText(x, y + 190, kag.bookMarkDates[s], 0xF0F0F0, 255, true);
        } else {
             textLayer.font.height = 18;
             textLayer.drawText(x, y + 140, "No Data", 0x888888, 255, true);
        }

        // Create Button
        var btnExp = "tf.sel_slot=" + s + "; global.sl_checkSlot(" + existsStr + ", '" + mode + "')";
        var onEnterStr = "global.sl_onSlotEnter(" + i + ")";
        
        // Use locate
        kag.tagHandlers.locate(%[x: x, y: y]);

        var btn = %[
            graphic: "sys_config_bt_sound_DELETE", 
            target: "*click_wrapper",
            exp: btnExp,
            enterse: "hito_ge_kawaugoki08",
            onenter: onEnterStr,
            onleave: "global.sl_onSlotLeave()"
        ];
        kag.tagHandlers.button(btn);

        // HACK: Resize Slot Button
        var msgLayer = kag.back.messages[1]; 
        var lastLink = msgLayer.links[msgLayer.numLinks-1];
        if(lastLink !== void && lastLink.object !== void) {
            var bl = lastLink.object;
            bl.setImageSize(240, 200);
            bl.setSize(240, 200); 
            bl.fillRect(0, 0, 240, 200, 0x01000000); // Almost clear
            bl.opacity = 0; 
        }
    }
}

function sl_onSlotEnter(idx) {
    idx = +idx;
    var row = (idx < 4) ? 0 : 1;
    var col = idx % 4;
    var x = 100 + col * 280;
    var y = 150 + row * 300;
    var w = 240;
    var h = 200;

    var hlLayer = kag.fore.layers[sl_hl_layer_id];
    if (hlLayer === void) return;
    hlLayer.setPos(x, y); 
    hlLayer.type = ltAlpha; 
    hlLayer.setImageSize(w, h); 
    hlLayer.setSize(w, h);      
    hlLayer.face = dfAlpha;
    hlLayer.fillRect(0, 0, w, h, 0x00000000); 
    hlLayer.face = dfAuto;
    
    var col = 0xFFFF00; 
    var op = 192; var thick = 4;
    hlLayer.colorRect(0, 0, w, thick, col, op); 
    hlLayer.colorRect(0, h-thick, w, thick, col, op); 
    hlLayer.colorRect(0, 0, thick, h, col, op); 
    hlLayer.colorRect(w-thick, 0, thick, h, col, op); 
    hlLayer.visible = true;
}

function sl_onSlotLeave() {
    var hlLayer = kag.fore.layers[sl_hl_layer_id];
    // Check if layer exists before accessing
    if(hlLayer) hlLayer.visible = false;
}

function sl_checkSlot(exists, mode) {
    tf.do_action = false;
    if (mode == 'save') {
        tf.do_action = true;
    } else {
        if (exists) {
            tf.do_action = true;
        } else {
            System.inform("此位置没有存档。");
        }
    }
}

function sl_cleanupLayers() {
    var layersToClear = [9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    for(var i=0; i<layersToClear.count; i++) {
        var lid = layersToClear[i];
        if(kag.back.layers[lid] !== void) kag.back.layers[lid].visible = false;
        if(kag.fore.layers[lid] !== void) kag.fore.layers[lid].visible = false;
    }
}

function sl_fullCleanup() {
    var layersToClear = [9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    for(var i=0; i<layersToClear.count; i++) {
        var lid = layersToClear[i];
        if(kag.back.layers[lid] !== void) {
            kag.back.layers[lid].freeImage();
            kag.back.layers[lid].visible = false;
        }
        if(kag.fore.layers[lid] !== void) {
            kag.fore.layers[lid].freeImage();
            kag.fore.layers[lid].visible = false;
        }
    }
}
[endscript]

; Fallthrough to initialization
@layopt layer=message1 page=fore visible=true
@image layer=base page=back storage="bg1"

@if exp="typeof(tf.page) == 'undefined'"
@eval exp="tf.page = 0"
@endif

[if exp="f.inSaveMenu == true"]
[eval exp="f.inSaveMenu = false"]
[return]
[endif]
[eval exp="f.inSaveMenu = false"]

*draw_page
@layopt layer=message1 page=back visible=true
@current layer=message1 page=back
@er

; Execute Drawing Logic
[eval exp="sl_drawUI(tf.page, tf.mode)"]

; ------------------------------------------------------------------------------
; Return Button
; ------------------------------------------------------------------------------
@locate x=1100 y=650
@button graphic="sys_config_bt_sound_DELETE" target="*back" enterse="hito_ge_kawaugoki08" clickse="hito_ge_kawaugoki07" recthit=true
@locate x=1120 y=660
@font size=24
返回

@trans method=crossfade time=300
@wt
@s

; ==============================================================================
; Action Handlers
; ==============================================================================
*click_wrapper
[if exp="tf.do_action"]
    [jump target="*click_slot"]
[endif]
[s]

*click_slot
[if exp="tf.mode == 'save'"]
    [stoptrans]
    [eval exp="f.inSaveMenu = true"]
    [eval exp="kag.storeBookMark(tf.sel_slot)"]
    [jump target=*draw_page]

    [if exp="f.inSaveMenu == true"]
        [eval exp="f.inSaveMenu = false"]
        [return]
    [endif]
[else]
    [stoptrans]
    [eval exp="sl_cleanupLayers()"]
    [eval exp="kag.restoreBookMark(tf.sel_slot)"]
[endif]
[jump target=*draw_page]

*back
@layopt layer=message1 page=back visible=false
@layopt layer=message1 page=fore visible=false
[eval exp="sl_fullCleanup()"]
@er
@return
