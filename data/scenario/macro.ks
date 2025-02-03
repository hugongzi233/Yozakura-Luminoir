*macro|MARCO
@position layer=message0 page=back frame=""
@current layer=message0 page=back
@er

; 显示立绘宏
; 使用方法 @stand face="图片" layer=1 pos="l lc c rc r"(可选)
[macro name=stand]
@backlay
@image layer=%layer page=back storage=%face visible=true left=0 top=0 pos=%pos
@trans method=crossfade time=300
@wt
[endmacro]

; 显示背景宏
; 使用方法 @bg background="文件名" (自定义效果可选 method="universal" rule="文件名" vague= time=)
[macro name=bg]
@image layer=base page=back storage=%background visible=true left=0 top=0 opacity=255
[if exp="mp.method!=''"]
@trans method=%method rule=%rule vague=%vague time=%time
[else]
@trans method=crossfade time=400
[endif]
@wt
[endmacro]

; 显示对话框宏
[macro name=showmsg]
@position layer=message0 left=0 top=&(720-160) width=1280 height=160 marginl=200 margint=0 marginr=70 marginb=16 opacity=0 visible=true frame="frame" page=back
@trans method=crossfade time=800
@wt
[endmacro]

; 文字显示与语音宏
; 使用方法：@n name="名字" se="音效"(可选)
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

; 清除对话框宏
[macro name=clearmsg]
@position layer=message0 frame="" page=back
@trans method=crossfade time=800 cond="mp.effect==true"
@wt
[endmacro]

; 清除立绘宏
; 使用方法 @clearstand layer=1 effect=true(可选)
[macro name=clearstand]
@freeimage layer=%layer page=back
@trans method=crossfade time=300 cond="mp.effect==true"
@wt
[endmacro]

; 清除背景宏
; 使用方法 @clearbg effect=true(可选)
[macro name=clearbg]
@freeimage layer=base page=back
@trans method=crossfade time=500 cond="mp.effect==true"
@wt
[endmacro]

@return