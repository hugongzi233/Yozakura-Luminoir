*open|
[position layer=message0 page=back frame=""]
[current layer=message0 page=back][er]

@macro name=显示人物立绘
[backlay]
[image layer=1 page=back storage=%face visible=true left=0 top=0]
[trans method=crossfade time=300][wt]
@endmacro

@macro name=显示背景
[image layer=base page=back storage=%background visible=true left=0 top=0 opacity=255]
[trans method=crossfade time=500][wt]
@endmacro

@macro name=显示对话框
[position layer=message0 left=0 top=&(720-160) width=1280 height=160 marginl=71 margint=0 marginr=73 marginb=17 opacity=0 visible=true page=back]
[trans method=crossfade time=800][wt]
@endmacro

@macro name=say
[current layer=message0 page=fore]
[font face="黑体" size=24 color=0xffffff]
[emb exp="'【' + mp.name + '】'"]
[p][l][r][emb exp="mp.text"]
[p][er]
@endmacro

;======================== 主流程 ========================
[显示背景 background="bg1"]
[显示人物立绘 face="bt1"]
[显示对话框]

[say name="张三" text="你好，欢迎来到我的世界。"]
[say name="李四" text="今天天气真不错！"]
[say name="张三" text="要一起去冒险吗？"]