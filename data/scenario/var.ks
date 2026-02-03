;--------------------------------------------------
; 系统变量
;--------------------------------------------------
@iscript
global.applySystemSettings = function() {
    // BGM 音量
    kag.bgm.setOptions(%[gvolume: sf.bgmVol]);
    
    // SE 音量
    for(var i=0; i< kag.numSEBuffers; i++) {
        kag.se[i].setOptions(%[gvolume: sf.seVol]);
    }

    // 文字速度
    kag.userChSpeed = 100 - sf.textSpeed;

    // 自动模式速度
    kag.autoModeSpeed = 5000 - (sf.autoSpeed * 45);

    // 字体
    var count = kag.fore.messages.count;
    for(var i=0; i<count; i++) {
        kag.fore.messages[i].font.height = sf.fontSize;
        kag.back.messages[i].font.height = sf.fontSize;
        kag.fore.messages[i].font.face = sf.fontFace;
        kag.back.messages[i].font.face = sf.fontFace;
    }
};

// 重置设置
global.resetSystemSettings = function() {
    sf.bgmVol = 100;
    sf.seVol = 100;
    sf.textSpeed = 80;
    sf.autoSpeed = 80;
    sf.skipUnread = false; 
    sf.fontSize = 24;
    sf.fontFace = "黑体";
    
    global.applySystemSettings();
};

// 初始化
if(sf.bgmVol === void) sf.bgmVol = 100;
if(sf.seVol === void) sf.seVol = 100;
if(sf.textSpeed === void) sf.textSpeed = 80;
if(sf.autoSpeed === void) sf.autoSpeed = 80;
if(sf.skipUnread === void) sf.skipUnread = false;
if(sf.fontSize === void) sf.fontSize = 24;
if(sf.fontFace === void) sf.fontFace = "黑体";

global.applySystemSettings();

@endscript
@return
