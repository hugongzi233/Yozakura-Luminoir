;--------------------------------------------------
; 系统设置
;--------------------------------------------------

*start
@iscript
if (typeof global.SliderLayer == "undefined") {
    Scripts.execStorage("SliderLayer.tjs");
}

if (typeof global.config_sliders == "undefined") {
    global.config_sliders = [];
}

global.clearSliders = function() {
    if (typeof global.config_sliders == "undefined") return;
    for (var i = 0; i < global.config_sliders.count; i++) {
        if (global.config_sliders[i] !== null && isvalid global.config_sliders[i]) {
            invalidate global.config_sliders[i];
        }
    }
    global.config_sliders = [];
};

// 创建滑块
global.createSlider = function(x, y, w, h, min, max, pos, onChange) {
    var slider = new SliderLayer(kag, kag.fore.base);
    slider.absolute = 200000;
    slider.left = x;
    slider.top = y;
    slider.width = w;
    slider.height = h;
    slider.min = min;
    slider.max = max;
    
    if(pos < min) pos = min;
    if(pos > max) pos = max;

    slider.setPos(pos);
    slider.onChangeHandler = onChange;
    
    slider.visible = true;
    slider.focus(); 
    global.config_sliders.add(slider);
    return slider;
};
@endscript

@stoptrans
@cm
@clickskip enabled=false
@rclick enabled=false

; 绘制背景 (请替换为您自己的背景图片, 这里用黑色填充代替)
@layopt layer=base page=fore visible=true
; @eval exp="kag.fore.base.fillRect(0, 0, kag.scWidth, kag.scHeight, 0xFF333333)"
@set_background background="bg2" method=scroll time=0

; 初始化变量
@if exp="typeof(tf.config_tab) == 'undefined'"
@eval exp="tf.config_tab = 'display'"
@endif

; --------------------------------------------------------------------------
; 绘制标签页按钮 (Tabs)
; --------------------------------------------------------------------------
@locate x=50 y=50
@button graphic="sys_config_bt_sound_DELETE" target="*set_tab_display" enterse="hito_ge_kawaugoki08" clickse="hito_ge_kawaugoki07" recthit=true
@locate x=250 y=50
@button graphic="sys_config_bt_sound_DELETE" target="*set_tab_game" enterse="hito_ge_kawaugoki08" clickse="hito_ge_kawaugoki07" recthit=true
@locate x=450 y=50
@button graphic="sys_config_bt_sound_DELETE" target="*set_tab_text" enterse="hito_ge_kawaugoki08" clickse="hito_ge_kawaugoki07" recthit=true
@locate x=650 y=50
@button graphic="sys_config_bt_sound_DELETE" target="*set_tab_audio" enterse="hito_ge_kawaugoki08" clickse="hito_ge_kawaugoki07" recthit=true
@locate x=850 y=50
@button graphic="sys_config_bt_sound_DELETE" target="*set_tab_control" enterse="hito_ge_kawaugoki08" clickse="hito_ge_kawaugoki07" recthit=true
@locate x=1050 y=50
@button graphic="sys_config_bt_sound_DELETE" target="*set_tab_about" enterse="hito_ge_kawaugoki08" clickse="hito_ge_kawaugoki07" recthit=true

; --------------------------------------------------------------------------
; 底部功能按钮
; --------------------------------------------------------------------------

; 恢复默认设置
@locate x=950 y=650
@button graphic="sys_config_bt_sound_DELETE" target="*reset_defaults" enterse="hito_ge_kawaugoki08" clickse="hito_ge_kawaugoki07" recthit=true

; 返回标题
@locate x=1150 y=650
@button graphic="sys_config_bt_sound_DELETE" target="*exit_config" enterse="hito_ge_kawaugoki08" clickse="hito_ge_kawaugoki07" recthit=true

; --------------------------------------------------------------------------
; 显示当前标签页内容
; --------------------------------------------------------------------------

@eval exp="global.clearSliders()"

; 根据当前标签跳转
@if exp="tf.config_tab == 'display'"
@jump target="*content_display"
@endif
@if exp="tf.config_tab == 'game'"
@jump target="*content_game"
@endif
@if exp="tf.config_tab == 'text'"
@jump target="*content_text"
@endif
@if exp="tf.config_tab == 'audio'"
@jump target="*content_audio"
@endif
@if exp="tf.config_tab == 'control'"
@jump target="*content_control"
@endif
@if exp="tf.config_tab == 'about'"
@jump target="*content_about"
@endif

@s

; --------------------------------------------------------------------------
; 标签切换逻辑
; --------------------------------------------------------------------------

*set_tab_display
@eval exp="tf.config_tab = 'display'"
@jump target="*start"

*set_tab_game
@eval exp="tf.config_tab = 'game'"
@jump target="*start"

*set_tab_text
@eval exp="tf.config_tab = 'text'"
@jump target="*start"

*set_tab_audio
@eval exp="tf.config_tab = 'audio'"
@jump target="*start"

*set_tab_control
@eval exp="tf.config_tab = 'control'"
@jump target="*start"

*set_tab_about
@eval exp="tf.config_tab = 'about'"
@jump target="*start"

; --------------------------------------------------------------------------
; 内容实现
; --------------------------------------------------------------------------

*content_display
@locate x=100 y=200
@font size=30
显示设置内容区域:
@r
; 全屏/窗口切换
@locate x=100 y=300
@button graphic="sys_config_bt_sound_DELETE" exp="kag.onWindowedMenuItemClick(kag)" enterse="hito_ge_kawaugoki08" clickse="hito_ge_kawaugoki07" recthit=true
@s

*content_game
@locate x=100 y=200
@font size=30
游戏设置内容区域:
@r
; 未读快进开关
@locate x=100 y=300
@if exp="sf.skipUnread"
@button graphic="sys_config_bt_sound_DELETE" exp="sf.skipUnread = false" target="*start" enterse="hito_ge_kawaugoki08" clickse="hito_ge_kawaugoki07" recthit=true
@else
@button graphic="sys_config_bt_sound_DELETE" exp="sf.skipUnread = true" target="*start" enterse="hito_ge_kawaugoki08" clickse="hito_ge_kawaugoki07" recthit=true
@endif
@s

*content_text
@locate x=100 y=150
@font size=30
文本设置:

; 字体大小
@locate x=100 y=220
字体大小 (18 - 48)
@iscript
global.createSlider(300, 230, 400, 20, 18, 48, sf.fontSize, function(slider, pos) {
    sf.fontSize = pos;
    // 遍历所有消息层设置字体大小
    var count = kag.fore.messages.count;
    for(var i=0; i<count; i++) {
        kag.fore.messages[i].font.height = pos;
        kag.back.messages[i].font.height = pos;
    }
});
@endscript

; 文字速度滑块
@locate x=100 y=320
文字显示速度 (左:慢 - 右:快)
@iscript
// 使用 sf.textSpeed (0-100)
global.createSlider(300, 330, 400, 20, 0, 100, sf.textSpeed, function(slider, pos) {
    sf.textSpeed = pos;
    kag.userChSpeed = 100 - pos;
});
@endscript

; 自动前进速度
@locate x=100 y=420
自动前进速度 (左:慢 - 右:快)
@iscript
// 使用 sf.autoSpeed (0-100) 
global.createSlider(300, 430, 400, 20, 0, 100, sf.autoSpeed, function(slider, pos) {
    sf.autoSpeed = pos;
    kag.autoModeSpeed = 5000 - (pos * 45); 
});
@endscript
@s

*content_audio
@locate x=100 y=200
@font size=30
音频设置内容区域:

; BGM 音量
@locate x=100 y=300
BGM 音量
@iscript
global.createSlider(300, 310, 400, 20, 0, 100, sf.bgmVol, function(slider, pos) {
    sf.bgmVol = pos;
    kag.bgm.setOptions(%[gvolume: pos]);
});
@endscript

; SE 音量
@locate x=100 y=400
SE 音量
@iscript
global.createSlider(300, 410, 400, 20, 0, 100, sf.seVol, function(slider, pos) {
    sf.seVol = pos;
    for(var i=0; i< kag.numSEBuffers; i++) {
        kag.se[i].setOptions(%[gvolume: pos]);
    }
});
@endscript
@s

*content_control
@locate x=100 y=200
@font size=30
控制设置内容区域:
@r
(此处可以放置按键绑定说明或设置)
@s

*content_about
@locate x=100 y=200
@font size=30
关于:
@r
@font size=24
Galgame 示例工程
@r
Powered by KRKRZ + KAG3
@s

; --------------------------------------------------------------------------
; 退出和重置
; --------------------------------------------------------------------------
*exit_config
@eval exp="global.clearSliders()"
@clickskip enabled=true
; 返回标题画面
@jump storage="title.ks" target="*title"
@s

*reset_defaults
@eval exp="global.clearSliders()"
; 重置逻辑
@eval exp="global.resetSystemSettings()"
@jump target="*start"
@s
