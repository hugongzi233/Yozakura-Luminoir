; ==========================
; 
; ==========================
; 游戏入口
*start|入口
; 禁止存档
@disablestore store=true
; 关闭右键菜单
@rclick enabled=false
; 不可跳过
@clickskip enabled=false
; 关闭历史记录功能
@history enabled=false output=false
; 加载音频播放插件
@loadplugin module="wuvorbis.dll"
; 加载macro
@call storage="macro.ks" target="*macro"

@eval exp="f.windowTitle='游戏标题'"
@set_window_title title='&f.windowTitle'

; 进入
@position layer=base page=back visible=true opacity=0 top=0 height=720 left=0 width=1280 marginl=0 margint=0 marginr=0 marginb=0 frame=""
@position layer=message0 page=back visible=false opacity=0 top=0 height=720 left=0 width=1280 marginl=0 margint=0 marginr=0 marginb=0 frame=""
@position layer=message0 page=fore visible=false opacity=0 top=0 height=720 left=0 width=1280 marginl=0 margint=0 marginr=0 marginb=0 frame=""
@position layer=0 page=back visible=true opacity=0 top=0 height=720 left=0 width=1280 marginl=0 margint=0 marginr=0 marginb=0 frame=""
@position layer=0 page=fore visible=true opacity=0 top=0 height=720 left=0 width=1280 marginl=0 margint=0 marginr=0 marginb=0 frame=""
@position layer=1 page=back visible=true opacity=0 top=0 height=720 left=0 width=1280 marginl=0 margint=0 marginr=0 marginb=0 frame=""
@position layer=1 page=fore visible=true opacity=0 top=0 height=720 left=0 width=1280 marginl=0 margint=0 marginr=0 marginb=0 frame=""
@position layer=2 page=back visible=true opacity=0 top=0 height=720 left=0 width=1280 marginl=0 margint=0 marginr=0 marginb=0 frame=""
@position layer=2 page=fore visible=true opacity=0 top=0 height=720 left=0 width=1280 marginl=0 margint=0 marginr=0 marginb=0 frame=""
@current layer=message0 page=back

; Logo界面，开发测试时请注释此行
@jump target="*logo" storage="logo.ks"

; @jump storage="title.ks" target="*title"