; ==========================
; 
; ==========================
; 游戏入口
*start|入口
; 关闭右键菜单
@rclick enabled=false
; 不可跳过
@clickskip enabled=false
; 关闭历史记录功能
@history enabled=false output=false
; 加载音频播放插件
@loadplugin module="wuvorbis.dll"
; 隐藏message0层
@layopt layer=message0 visible=false
; 加载macro
@call storage="macro.ks" target="*macro"
; LOGO TODO

@SetWindowTitle title="游戏标题"

; 进入
@position layer=message0 page=back visible=true opacity=0 top=0 height=720 left=0 width=1280 marginl=0 margint=0 marginr=0 marginb=0 frame=""
@current layer=message0 page=back
@jump target="*logo" storage="logo.ks"