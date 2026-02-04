; ==========================
; game entry
; ==========================
; 游戏入口
*start|入口
@call target="*init"


[if exp="f.seenLogo == true"]
@jump target="*title" storage="title.ks"
[endif]

@jump target="*logo" storage="logo.ks"

*init|初始化
@call storage="var.ks"
@call storage="macro.ks"

; Load Custom System Scripts
[iscript]
Scripts.execStorage("MySaveLoad.tjs");
[endscript]

@init_system_settings
@init_system_layers

@eval exp="f.windowTitle='游戏标题'"
@set_window_title title='&f.windowTitle'
@return