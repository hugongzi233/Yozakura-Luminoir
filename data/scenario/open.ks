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
@position layer=message0 left=0 top=&(720-160) width=1280 height=160 marginl=71 margint=0 marginr=73 marginb=17 opacity=0 visible=true frame="frame" page=back
@trans method=crossfade time=800
@wt
[endmacro]

[macro name=say]
@current layer=message0 page=fore
@font face="黑体" size=24 color=0xffffff
@nowait
@emb exp="mp.name"
@r
@endnowait
@emb exp="mp.text"
@p
@er
[endmacro]

;======================== 主流程 ========================
@bg background="bg1"
@fg face="bt1"
@showmsg

@say name="【张三】" text="你好，欢迎来到我的世界。"
@say name="【李四】" text="今天天气真不错！"
@say name="" text="要一起去冒险吗？"