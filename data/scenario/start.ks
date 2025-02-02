; 游戏入口
*start
; 关闭右键菜单
@rclick enabled=false
; 不可跳过
@clickskip enabled=false
; 关闭历史记录功能
@history enabled=false output=false
; 加载ogg播放插件
@loadplugin module="wuvorbis.dll"
; 隐藏message0层
@layopt layer=message0 visible=false

@jump target="*title" storage="title.ks"