*open|
[position layer=message0 page=back frame=""]
[current layer=message0 page=back][er]
;清空messge1，就是把封面清除掉

@macro name=出现人物立绘
[backlay]
[image layer=1 page=back storage=&("bt"+mp.face) visible=true left=0 top=0]
; [pimage storage=&("btf"+mp.face) layer=1 visible=true dx=260 dy=107 page=back cond="mp.face!=void"]
; ;mp变量相当于传递参数，只用在macro里边，在外边的代码里使用[出现人物立绘 face=1]，1这个值就会被传给mp.face，然后在macro里边进行使用，因为这个立绘有两张脸，我们在出立绘的时候只要写face的参数来控制角色用的哪个表情就可以了，同理也可以用这个来控制角色站立坐标，角色使用图层，trans时间之类之类的……
[trans method=crossfade time=300][wt]
@endmacro

@macro name=出现对话框
[position layer=message0 left=0 top=&(720-160) width=720 height=1080 marginl=71 margint=17 marginr=73 marginb=17 opacity=0 visible=true frame="frame" page=back]
[trans method=crossfade time=800][wt]
@endmacro

@macro name=更改背景图片
[image layer=base page=back storage=%storage visible=true left=0 top=0 opacity=255]
;%这个符号也是代表后边的是传参，在这里写storage=%storage和storage=&mp.storage是等效的，这个也是只用在macro里的
[trans method=crossfade time=500][wt]
@endmacro

@macro name=对话框消失
[position layer=message0 frame="" page=back]
[trans method=crossfade time=800][wt]
@endmacro

@macro name=人物立绘消失
[freeimage layer=1 page=back]
[trans method=crossfade time=300][wt]
@endmacro

@macro name=背景消失
[freeimage layer=base page=back]
[trans method=crossfade time=500][wt]
@endmacro

; [playse storage="test"]
;这里就是演示一下播放音效的效果，请大家自己随便找一个wav格式的音乐文件放到sound文件夹里，改名为test


[current layer=message0 pgae=fore]
[deffont face="黑体" size=32 color=0xffffff]
[defstyle linespacing=10 pitch=0 linesize=4]
[er]
[rclick call=true target=*rclick enabled=true]
;这一句就是从现在开始（也就是游戏刚开始，macro里边的内容kr只是载入但是只有在脚本里边调用了这个macro的时候才会执行的）右键点击的话就会call到*rclick这个标签那里

[更改背景图片 storage="bg1"]
[出现人物立绘 face=2]
[出现对话框]

我讨厌你。[p][er]

[rclick enabled=false]
;enabled=false的话右键点击就失效了，无论你怎么点都不会触发任何事件

[出现人物立绘 face=1]
[current layer=message0 pgae=fore]
所以我要关掉右键菜单。[p][er]

[rclick enabled=true]
;enabled=true的话右键再次开启，注意即使不用写其他的参数，也会按照最近的设置来进行跳转（当然如果遇到右键跳转变动的很频繁的情况建议每次都重新定义下以防万一=_=）

[出现人物立绘 face=2]
[current layer=message0 pgae=fore]
果然还是拒绝不了你的笑容。好吧……还是开放给你用吧。[p][er]

[对话框消失]
[人物立绘消失]
[背景消失]

[jump target=*open]
;跳回开始画面

;=================我是右键菜单具体内容的分割线===============

*rclick
[backlay]
[position layer=message1 page=back left=250 top=200 width=300 height=200 marginl=0 margint=0 marginr=0 marginb=0 opacity=200 visible=true color=0x000000]
[current page=back layer=message1][er][nowait][font face="黑体" size=18 color=0xffffff]
[locate x=0 y=10]我就是传说中的右键菜单
[locate x=30 y=80][link target=*save]我是存档[endlink]
[locate x=30 y=120][link target=*load]我是读档[endlink]
[endnowait]
[trans method=crossfade time=800][wt]
[rclick jump=true target=*drclick enabled=true]
;注意这一句，在第一次设定rclick的时候，那个右键是希望在对话进行中随时可以用右键跳转到某处，同时希望操作完了时候可以根据自己的需要再跳回来进行对话，因此我用的是call=true
;现在右键跳转到了这边，我们就需要把右键关掉以防玩家抽风在这个界面点击右键重复呼唤这个界面
;我之前说过很多次了，kag的[call]指令是可以嵌套的，但是rclick的call使用的是callExtraConductor，这个函数是不能嵌套的，如果使用rclick call到一个标签，在读到第一个return前再次rclick call的话，前边的rclick call的位置会被kr遗忘掉……=_=|||||然后一般的情况就是会报错说“call和return的数目不能一一对应”之类的……
;所以为了避免出现这种错误，在设定rclick的时候注意点了一次右键进行了跳转后就把原来的右键设定关掉，或者像上边那句那样，更改rclick的设定，我这里是设定为在这个界面点击右键就Jump到*drclick这个标签
[s]

*drclick
;这里把右键菜单消除，然后return回去，程序读到了[return]这一句的时候就会自动跳回主程序里玩家按右键前执行到的那里继续执行了
[position layer=message1 page=back visible=false]
[current page=back layer=message1][er][trans method=crossfade time=800][wt]
[rclick call=true target=*rclick enabled=true]
;回到对话的时候还是要右键唤出右键菜单的，所以这里需要重新定义一遍
[return]
;=======================我是简陋的存读档界面的分割线======================

*save
[position layer=message1 page=back left=200 top=150 width=400 height=300 marginl=0 margint=0 marginr=0 marginb=0 opacity=200 visible=true color=0x000000]
*save0
[current page=back layer=message1][er][nowait][font face="黑体" size=18 color=0xffffff]
[locate x=10 y=5]我是存档界面

;第一个存档位
[locate x=10 y=30]

[button normal=&(kag.getBookMarkFileNameAtNum(0)) cond="kag.bookMarkDates[0] != void"]
;kag.getBookMarkFileNameAtNum(0)是kag的一个用来获取存档路径的函数，使用这个函数就会返回指定的存档的路径，后边那个（）里边的0就是要获得的存档路径的编号，数字从0开始
;kag.bookMarkDates[0]是存档日期，我这里用他来判断0号存档有没有内容，如果这个存档曾经被使用过那么存档日期肯定不是空的……
;这一句就是如果这个存档存在的话就用button载入存档的缩略图

[button normal="nodata" cond="kag.bookMarkDates[0] == void"]
;这一句是如果存档不存在就载入“NODATA”图

[locate x=180 y=50]
[link target=*savedata1][emb exp="kag.bookMarkDates[0]" cond="kag.bookMarkDates[0] != void"][emb exp="'--------------'" cond="kag.bookMarkDates[0] == void"][endlink]
;这里是把存档日期作为link显示出来，如果界面要精美一点一般都是用button作为存档按钮，然后在上边另建一个图层放上存档日期，存档画面，当前对话之类的信息，不过我这里懒得做界面了，就直接用文字link了……

;第二个存档位
[locate x=10 y=180]
[button normal=&(kag.getBookMarkFileNameAtNum(1)) cond="kag.bookMarkDates[1] != void"]
[button normal="nodata" cond="kag.bookMarkDates[1] == void"]
[locate x=180 y=200]
[link target=*savedata2][emb exp="kag.bookMarkDates[1]" cond="kag.bookMarkDates[1] != void"][emb exp="'--------------'" cond="kag.bookMarkDates[1] == void"][endlink]

[endnowait]
[trans method=crossfade time=800][wt]
[rclick jump=true target=*drclick enabled=true]
[s]
;只有两个存档位我就一个一个写了，如果有很多个的话建议封成macro来写……会短很多……

*savedata1
;存档在第一个位置
[save place=0 ask=false]
;存档就是这个save指令，具体内容参见下边的指令集
[jump target=*save0]
;这里跳转到save界面开头重新定义一遍界面来进行修改资料的刷新

*savedata2
;存档在第二个位置
[save place=1 ask=false]
[jump target=*save0]

*load
[position layer=message1 page=back left=200 top=150 width=400 height=300 marginl=0 margint=0 marginr=0 marginb=0 opacity=200 visible=true color=0x000000]
[current page=back layer=message1][er][nowait][font face="黑体" size=18 color=0xffffff]
[locate x=10 y=5]我是读档界面

;第一个存档位
[locate x=10 y=30]
[button normal=&(kag.getBookMarkFileNameAtNum(0)) cond="kag.bookMarkDates[0] != void"]
[button normal="nodata" cond="kag.bookMarkDates[0] == void"]
[locate x=180 y=50]
[link target=*loaddata1 cond="kag.bookMarkDates[0] != void"][emb exp="kag.bookMarkDates[0]" cond="kag.bookMarkDates[0] != void"][emb exp="'--------------'" cond="kag.bookMarkDates[0] == void"][endlink cond="kag.bookMarkDates[0] != void"]

;第二个存档位
[locate x=10 y=180]
[button normal=&(kag.getBookMarkFileNameAtNum(1)) cond="kag.bookMarkDates[1] != void"]
[button normal="nodata" cond="kag.bookMarkDates[1] == void"]
[locate x=180 y=200]
[link target=*loaddata1 cond="kag.bookMarkDates[1] != void"][emb exp="kag.bookMarkDates[1]" cond="kag.bookMarkDates[1] != void"][emb exp="'--------------'" cond="kag.bookMarkDates[1] == void"][endlink cond="kag.bookMarkDates[1] != void"]

[endnowait]
[trans method=crossfade time=800][wt]
[rclick jump=true target=*drclick enabled=true]
[s]
;其实这里对于条件的判断用if会更简洁一些……不过我个人偏爱用cond……

*loaddata1
;读档第一个位置
[load place=0 ask=false]
;load就是读档的指令，具体内容参见下边的指令集

*loaddata2
;读档第二个位置
[load place=1 ask=false]