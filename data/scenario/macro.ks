; ==============================================================================
; 宏定义
; ==============================================================================
;
; [set_stand]
;   显示角色立绘。
;   参数:
;     face   : 图片文件名 (必须)
;     layer  : 图层号 (默认: 1)
;     pos    : 位置 (l=左, lc=左中, c=中, rc=右中, r=右)
;     method : 切换方式 (默认: crossfade)
;     rule   : 切换规则文件
;     vague  : 模糊度
;     time   : 切换时间 (默认: 300)
;
; [set_background]
;   显示背景图片。
;   参数:
;     background : 图片文件名 (必须)
;     method     : 切换方式 (默认: crossfade)
;     rule       : 切换规则文件
;     vague      : 模糊度
;     time       : 切换时间 (默认: 400)
;
; [clear_stand]
;   清除角色立绘。
;   参数:
;     layer  : 图层号 (默认: 1)
;     method : 切换方式 (默认: crossfade)
;     rule   : 切换规则文件
;     vague  : 模糊度
;     time   : 切换时间 (默认: 300)
;
; [clear_bg]
;   清除背景。
;   参数:
;     method : 切换方式 (默认: crossfade)
;     rule   : 切换规则文件
;     vague  : 模糊度
;     time   : 切换时间 (默认: 500)
;
; [show_message_window]
;   显示消息框（对话框）。
;   参数: 无 (固定800ms淡入)
;
; [clear_message_window]
;   隐藏消息框。
;   参数:
;     effect : 如果为true，则使用过渡效果 (默认: false)
;
; [set_name]
;   设置当前说话人的名字（仅设置变量，不重绘名字框）。
;   参数:
;     name : 说话人名字
;
; [nm]
;   设置说话人名字并重绘名字框。
;   参数:
;     name : 说话人名字
;
; [nm_off]
;   清除说话人名字。
;
; [p]
;   等待点击并重绘名字框（通常用于一句对话结束后）。
;
; [show_btn]
;   显示按钮层 (message1)。
;   参数:
;     method, rule, vague, time (默认: 800)
;
; [clear_btn]
;   隐藏按钮层。
;   参数:
;     method, rule, vague, time (默认: 500)
;
; [set_window_title]
;   设置游戏窗口标题。
;   参数:
;     title : 标题字符串
;
; [set_window_subtitle]
;   设置窗口子标题（追加在原标题后）。
;   参数:
;     subtitle : 子标题字符串
;
; [set_full_screen]
;   设置全屏模式。
;   参数:
;     fullscreen : true 或 false
;
; [se]
;   播放音效。
;   参数:
;     storage : 音频文件名（支持所有 playse 参数）
;
; [bgm]
;   播放背景音乐。
;   参数:
;     storage : 音频文件名
;     delay   : 播放前的延迟时间 (毫秒)
;
; [bgm_stop]
;   停止背景音乐。
;   参数:
;     delay   : 停止前的延迟时间 (毫秒)
;
; [fade_out]
;   黑屏淡出（画面变黑）。
;   参数:
;     time : 持续时间 (默认: 1000)
;
; [fade_in]
;   黑屏淡入（从黑屏恢复显示）。
;   参数:
;     time : 持续时间 (默认: 1000)
;
; [shake]
;   屏幕震动效果。
;   参数:
;     time : 持续时间 (默认: 300)
;     vmax : 垂直震幅 (默认: 10)
;     hmax : 水平震幅 (默认: 10)
;
; [w]
;   等待指令简写。
;   参数:
;     time : 等待时间 (毫秒)
;     mode : 等待模式 (默认: normal)
;
; ==============================================================================

*macro|macro
[macro name=init_system_settings]
; 禁止存档 (Title screen generally doesn't need saving)
@disablestore store=true
; 关闭右键菜单 (For Title screen)
@rclick enabled=false
; 不可跳过
@clickskip enabled=false
; 开启历史记录功能 (Useful for backlog)
@history enabled=true output=true
; 加载音频播放插件
@loadplugin module="wuvorbis.dll"
; 允许回到标题
@startanchor enabled=true
[endmacro]

[macro name=reset_logo_state]
[eval exp="f.seenLogo = false"]
[endmacro]


; ==========================
; System Initialization
; ==========================
[macro name=init_system_layers]
@layopt layer=base page=back visible=true
@layopt layer=base page=fore visible=true

@position layer=message0 page=back visible=false opacity=255 left=0 top=&(720-160) width=1280 height=160 marginl=200 margint=0 marginr=70 marginb=16 frame="frame"
@position layer=message0 page=fore visible=false opacity=255 left=0 top=&(720-160) width=1280 height=160 marginl=200 margint=0 marginr=70 marginb=16 frame="frame"

@position layer=message1 page=back visible=false opacity=0 left=0 top=0 width=1280 height=720 marginl=0 margint=0 marginr=0 marginb=0 frame=""
@position layer=message1 page=fore visible=false opacity=0 left=0 top=0 width=1280 height=720 marginl=0 margint=0 marginr=0 marginb=0 frame=""

@layopt layer=0 page=back visible=false
@layopt layer=0 page=fore visible=false
@layopt layer=1 page=back visible=false
@layopt layer=1 page=fore visible=false
@layopt layer=2 page=back visible=false
@layopt layer=2 page=fore visible=false

@current layer=message0 page=back
[endmacro]

; ------------------------------------------------------------------------------
; Graphic Macros
; ------------------------------------------------------------------------------

[macro name=set_stand]
@backlay
@image layer=%layer|1 page=back storage=%face visible=true left=0 top=0 pos=%pos
@trans method=%method|crossfade rule=%rule vague=%vague time=%time|300
@wt
[endmacro]

[macro name=set_background]
@stoptrans
@backlay
@image layer=base page=back storage=%background visible=true left=0 top=0 opacity=255
@trans method=%method|crossfade rule=%rule vague=%vague time=%time|400
@wt
[endmacro]

[macro name=clear_stand]
@freeimage layer=%layer|1 page=back
@trans method=%method|crossfade rule=%rule vague=%vague time=%time|300
@wt
[endmacro]

[macro name=clear_bg]
@freeimage layer=base page=back
@trans method=%method|crossfade rule=%rule vague=%vague time=%time|500
@wt
[endmacro]

; ------------------------------------------------------------------------------
; Message Window Macros
; ------------------------------------------------------------------------------

[macro name=show_message_window]
@stoptrans
@position layer=message0 left=0 top=&(720-160) width=1280 height=160 marginl=200 margint=0 marginr=70 marginb=16 opacity=0 visible=true frame="frame" page=back
@trans method=crossfade time=800
@wt
[endmacro]

[macro name=clear_message_window]
@position layer=message0 frame="" page=back
@trans method=crossfade time=800 cond="mp.effect==true"
@wt
[endmacro]

; ------------------------------------------------------------------------------
; Name & Text Macros
; ------------------------------------------------------------------------------

[macro name=set_name]
@eval exp='f.currentName = mp.name'
[endmacro]

[macro name=_draw_name]
@current layer=message0 page=fore
@font face="黑体" size=24
@er
[nowait]
[if exp="f.currentName !== void && f.currentName != ''"]
@emb exp="'【'+f.currentName+'】'"
@r
[else]
　
@r
[endif]
[endnowait]
@resetfont
[endmacro]

[macro name=nm]
[eval exp="f.currentName = mp.name"]
@_draw_name
[endmacro]

[macro name=nm_off]
[eval exp="f.currentName = ''"]
@_draw_name
[endmacro]

[macro name=p]
@l
@_draw_name
[endmacro]

; ------------------------------------------------------------------------------
; Button Macros
; ------------------------------------------------------------------------------

[macro name=show_btn]
@backlay
@position layer=message1 page=back visible=true opacity=0 top=0 height=720 left=0 width=1280 marginl=0 margint=0 marginr=0 marginb=0
@current layer=message1 page=back
@er
@trans method=%method|crossfade rule=%rule vague=%vague time=%time|800
[endmacro]

[macro name=clear_btn]
@position layer=message1 frame="" page=back
@trans method=%method|crossfade rule=%rule vague=%vague time=%time|500
@wt
@current layer=message0 page=back
[endmacro]

; ------------------------------------------------------------------------------
; System Macros
; ------------------------------------------------------------------------------

[macro name="set_window_title"]
[eval exp='System.title = mp.title']
[endmacro]

[macro name="set_window_subtitle"]
@set_window_title title='&f.windowTitle + " " + &mp.subtitle'
[endmacro]

[macro name="set_full_screen"]
[eval exp='System.setFullScreen(mp.fullscreen)']
[endmacro]

[macro name="se"]
@playse *
[endmacro]

[macro name="bgm"]
[if exp="mp.delay !== void"]
@stopbgm
@w time=%delay
[endif]
@playbgm storage=%storage loop=true
[endmacro]

[macro name="bgm_stop"]
[if exp="mp.delay !== void"]
@stopbgm
@w time=%delay
[endif]
@stopbgm
[endmacro]

; ------------------------------------------------------------------------------
; Effect Macros
; ------------------------------------------------------------------------------

[macro name="fade_out"]
@backlay
@position layer=2 page=back visible=true opacity=255 left=0 top=0 width=1280 height=720 color=0x000000
@trans method=crossfade time=%time|1000
@wt
[endmacro]

[macro name="fade_in"]
@backlay
@layopt layer=2 page=back visible=false
@trans method=crossfade time=%time|1000
@wt
[endmacro]

[macro name="shake"]
@quake time=%time|300 vmax=%vmax|10 hmax=%hmax|10
@wt
[endmacro]

[macro name="w"]
@wait time=%time mode=%mode|normal
[endmacro]

@return

