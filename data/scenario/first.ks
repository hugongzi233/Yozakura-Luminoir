; ==========================
; game entry
; ==========================
; 游戏入口
*start|入口
@call storage="var.ks"
@call target="*init"

@jump storage="title.ks"
; Logo界面，开发测试时请注释此行
@jump target="*logo" storage="logo.ks"

*init|初始化
@call storage="macro.ks" target="*macro"

@init_system_settings
@init_system_layers

@eval exp="f.windowTitle='游戏标题'"
@set_window_title title='&f.windowTitle'
@return