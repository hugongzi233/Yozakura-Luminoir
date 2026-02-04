; ==============================================================================
; Save Screen
; ==============================================================================

*start
@stoptrans
@rclick target="*back" jump=true enabled=true
[iscript]
// Ensure menu is initialized
if(typeof global.saveLoadMenu == "undefined") Scripts.execStorage("MySaveLoad.tjs");

// Show Menu
global.saveLoadMenu.show('save');
[endscript]
@trans method=crossfade time=300
@wt
@s

; ------------------------------------------------------------------------------
; Page Redraw Handler (for Tabs)
; ------------------------------------------------------------------------------
*draw_page
[iscript]
// tf.page is set by the button click
global.saveLoadMenu.drawPage(tf.page);
[endscript]
@trans method=crossfade time=300
@wt
@s

; ==============================================================================
; Logic Handlers
; ==============================================================================

*do_save
; Save Logic
; We use global.menu_saving to distinguish between the moment of saving and loading
[eval exp="global.menu_saving = true"]
[eval exp="tf.slot = mp.slot !== void ? mp.slot : tf.targetSlot"]
[eval exp="kag.storeBookMark(tf.slot)"]
[if exp="global.menu_saving == true"]
    ; Currently saving
    [eval exp="global.menu_saving = false"]
    ; Refresh UI (Refresh current page)
    [eval exp="global.saveLoadMenu.drawPage(global.saveLoadMenu.page)"]
    @trans method=crossfade time=100
    @wt
    @s
[else]
    ; Just loaded
    [jump target="*back"]
[endif]

*back
@rclick call="" target="" jump=false enabled=true
[iscript]
global.saveLoadMenu.cleanup();
[endscript]
@return
