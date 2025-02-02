*open|
@position layer=message0 page=back frame=""
@current layer=message0 page=back
@er

[macro name=fg]
@backlay
@image layer=1 page=back storage=%face visible=true left=0 top=0
@trans method=crossfade time=300
@wt
[endmacro]

[macro name=bg]
@image layer=base page=back storage=%background visible=true left=0 top=0 opacity=255
@trans method=crossfade time=500
@wt
[endmacro]

[macro name=showmsg]
@position layer=message0 left=0 top=&(720-160) width=1280 height=160 marginl=180 margint=0 marginr=73 marginb=17 opacity=0 visible=true frame="frame" page=back
@trans method=crossfade time=800
@wt
[endmacro]

; 文字显示宏
; 使用方法：@say name="名字" text="第一行" text2="第二行"(可选)
[macro name=say]
@current layer=message0 page=fore
@font face="黑体" size=24
@er
[nowait]
@emb exp="'【'+mp.name+'】'" cond="mp.name!=''"
@r
[endnowait]
@resetfont
@emb exp="mp.text"
[if exp="mp.text2!=''"]
@r
@emb exp="mp.text2"
[endif]
@p
[endmacro]

; 1-1
@playbgm storage="wbgm02.ogg"
@bg background="bg1"
@fg face="bt1"
@showmsg

@say name="" text="要一起去冒险吗？"
@say name="女孩" text="这个鬼东西怎么这么难学啊！！！" text2="我要放弃了！"
@say name="李四" text="今天天气真不错！"
@say name="" text="要一起去冒险吗？"