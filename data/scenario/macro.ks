; ==========================
; Macro Definitions
; ==========================
;
; Usage:
; SetStand 显示立绘
;   参数: face="图片" layer=1 pos="l lc c rc r" method="universal" rule="文件名" vague= time=
; SetBackground 显示背景
;   参数: background="文件名" (method="universal" rule="文件名" vague= time=)
; ShowMessageWindow 显示对话框
; n 名字显示与语音
;   参数：name="名字" se="音效"(可选)
; ClearMessageWindow 清除对话框
; ClearStand 清除立绘
;  参数: layer=1 (method="universal" rule="文件名" vague= time=)
; ClearBg 清除背景
;  参数: (method="universal" rule="文件名" vague= time=)
; ClearBtn 清除按钮背景
;  参数: (method="universal" rule="文件名" vague= time=)
; ShowBtn 显示按钮背景
; SetWindowTitle 设置窗口标题
;   参数: title="标题文字"
; SetFullScreen 设置全屏/窗口模式
;   参数: fullscreen=true/false

*macro|macro
@position layer=message0 page=back frame=""
@position layer=message1 page=fore frame=""
@current layer=message0 page=back
@er

[macro name=SetStand]
@backlay
@image layer=%layer page=back storage=%face visible=true left=0 top=0 pos=%pos
[if exp="mp.method!=''"]
@trans method=%method rule=%rule vague=%vague time=%time
[else]
@trans method=crossfade time=300
[endif]
@wt
[endmacro]

[macro name=SetBackground]
@image layer=base page=back storage=%background visible=true left=0 top=0 opacity=255
[if exp="mp.method!=''"]
@trans method=%method rule=%rule vague=%vague time=%time
[else]
@trans method=crossfade time=400
[endif]
@wt
[endmacro]

[macro name=ShowMessageWindow]
@position layer=message0 left=0 top=&(720-160) width=1280 height=160 marginl=200 margint=0 marginr=70 marginb=16 opacity=0 visible=true frame="frame" page=back
@trans method=crossfade time=800
@wt
[endmacro]

[macro name=n]
@stopse
@playse storage=%se cond="mp.se!=''"
@current layer=message0 page=fore
@font face="黑体" size=24
@er
[nowait]
@emb exp="'【'+mp.name+'】'" cond="mp.name!=''"
@r
[endnowait]
@resetfont
[endmacro]

[macro name=se]
@playse *
[endmacro]

[macro name=ClearMessageWindow]
@position layer=message0 frame="" page=back
@trans method=crossfade time=800 cond="mp.effect==true"
@wt
[endmacro]

[macro name=ClearStand]
@freeimage layer=%layer page=back
@freeimage layer=%layer page=fore
[if exp="mp.method!=''"]
@trans method=%method rule=%rule vague=%vague time=%time
[else]
@trans method=crossfade time=300
[endif]
@wt
[endmacro]

[macro name=ClearBg]
@freeimage layer=base page=back
[if exp="mp.method!=''"]
@trans method=%method rule=%rule vague=%vague time=%time
[else]
@trans method=crossfade time=500
[endif]
@wt
[endmacro]

[macro name=ClearBtn]
@position layer=message1 frame="" page=back
[if exp="mp.method!=''"]
@trans method=%method rule=%rule vague=%vague time=%time
[else]
@trans method=crossfade time=500
[endif]
@wt
@current layer=message0 page=back
[endmacro]

[macro name=ShowBtn]
@backlay
@position layer=message1 page=back visible=true opacity=0 top=0 height=720 left=0 width=1280 marginl=0 margint=0 marginr=0 marginb=0
@current layer=message1 page=back
@er
[if exp="mp.method!=''"]
@trans method=%method rule=%rule vague=%vague time=%time
[else]
@trans method=crossfade time=800
[endif]
[endmacro]

[macro name="SetWindowTitle"]
[eval exp='System.title = mp.title']
[endmacro]

; [macro name="SetWindowSize"]
; [eval exp='f.width = mp.width']
; [eval exp='f.height = mp.height']
; [eval exp='System.setMode(f.width, f.height)']
; [endmacro]
; @SetWindowSize width=1920 height=1080

[macro name="SetFullScreen"]
[eval exp='System.setFullScreen(mp.fullscreen)']
[endmacro]

@return