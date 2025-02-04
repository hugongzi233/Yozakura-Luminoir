*test|Test空间
; ==========================
; 1-1
@clearall
@playbgm storage="wbgm02.ogg"
@bg background="bg2" method="universal" rule="dot" vague=10 time=500
@stand face="bt2" layer=2 pos="c"
@rclick call=true target=*rclick enabled=true

@showmsg

@n name="女孩"
今天天气真不错！[p]
@n name=""
要跟我一起去山里玩吗？[p]

*choose1-1|我决定了!...
@showbtn
@locate x=90 y=100
@button graphic="select" text="我想继续跟你一起走下去" color=0xffffff size=26 offset=77 target="*win"

@locate x=90 y=210
@button graphic="select" text="对不起，我拒绝" color=0xffffff size=26 offset=40 target="*lose"
@wt
@s

*win
@clearbtn
@showmsg

@stand face="bt2" layer=2 pos="c"

@n name="女孩" se="alic0008.ogg"
好耶！！[r]走吧！[p]
@return

*lose
@clearbtn
@showmsg

@clearstand layer=2 effect=false
@clearstand layer=1 effect=false

@bg background="bg1"
@stand face="bt1" layer=2 pos="c"
@n name="女孩" se="alic0063.ogg"
你这个整天无所事事、[ruby text="龌龊变态"]油腻肮脏、[font size=30 color=0xFF3300]不修边幅[resetfont]，只会对着电脑屏幕傻笑的白痴给我去死！[p]

@return



*rclick
[locksnapshot]
[backlay]
[position layer=message2 page=back left=250 top=200 width=300 height=200 marginl=0 margint=0 marginr=0 marginb=0 opacity=200 visible=true color=0x000000]
[current page=back layer=message2][er][nowait][font face="黑体" size=18 color=0xffffff]
[locate x=0 y=10]我就是传说中的右键菜单
[locate x=30 y=80][link target=*save]我是存档[endlink]
[locate x=30 y=120][link target=*load]我是读档[endlink]
[endnowait]
[trans method=crossfade time=800][wt]
[rclick jump=true target=*drclick enabled=true]

@s
*drclick
;这里把右键菜单消除，然后return回去，程序读到了[return]这一句的时候就会自动跳回主程序里玩家按右键前执行到的那里继续执行了
[position layer=message2 page=back visible=false]
[current page=back layer=message2][er][trans method=crossfade time=800][wt]
[rclick call=true target=*rclick enabled=true]
;回到对话的时候还是要右键唤出右键菜单的，所以这里需要重新定义一遍
[unlocksnapshot]
[return]
@s
*save
[position layer=message2 page=back left=200 top=150 width=400 height=300 marginl=0 margint=0 marginr=0 marginb=0 opacity=200 visible=true color=0x000000]
*save0
[current page=back layer=message2][er][nowait][font face="黑体" size=18 color=0xffffff]
[locate x=10 y=5]我是存档界面
;第一个存档位
[locate x=10 y=30]
[button graphic=&(kag.getBookMarkFileNameAtNum(0)) cond="kag.bookMarkDates[0] != void"]
;kag.getBookMarkFileNameAtNum(0)是kag的一个用来获取存档路径的函数，使用这个函数就会返回指定的存档的路径，后边那个（）里边的0就是要获得的存档路径的编号，数字从0开始
;kag.bookMarkDates[0]是存档日期，我这里用他来判断0号存档有没有内容，如果这个存档曾经被使用过那么存档日期肯定不是空的……
;这一句就是如果这个存档存在的话就用button载入存档的缩略图
[button graphic="nodata" cond="kag.bookMarkDates[0] == void"]
;这一句是如果存档不存在就载入“NODATA”图
[locate x=180 y=50]
[link target=*savedata1][emb exp="kag.bookMarkDates[0]" cond="kag.bookMarkDates[0] != void"][emb exp="'--------------'" cond="kag.bookMarkDates[0] == void"][endlink]
;这里是把存档日期作为link显示出来，如果界面要精美一点一般都是用button作为存档按钮，然后在上边另建一个图层放上存档日期，存档画面，当前对话之类的信息，不过我这里懒得做界面了，就直接用文字link了……
;第二个存档位
[locate x=10 y=180]
[button graphic=&(kag.getBookMarkFileNameAtNum(1)) cond="kag.bookMarkDates[1] != void"]
[button graphic="nodata" cond="kag.bookMarkDates[1] == void"]
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
@s
*load
[position layer=message2 page=back left=200 top=150 width=400 height=300 marginl=0 margint=0 marginr=0 marginb=0 opacity=200 visible=true color=0x000000]
[current page=back layer=message2][er][nowait][font face="黑体" size=18 color=0xffffff]
[locate x=10 y=5]我是读档界面
;第一个存档位
[locate x=10 y=30]
[button graphic=&(kag.getBookMarkFileNameAtNum(0)) cond="kag.bookMarkDates[0] != void"]
[button graphic="nodata" cond="kag.bookMarkDates[0] == void"]
[locate x=180 y=50]
[link target=*loaddata1 cond="kag.bookMarkDates[0] != void"][emb exp="kag.bookMarkDates[0]" cond="kag.bookMarkDates[0] != void"][emb exp="'--------------'" cond="kag.bookMarkDates[0] == void"][endlink cond="kag.bookMarkDates[0] != void"]
;第二个存档位
[locate x=10 y=180]
[button graphic=&(kag.getBookMarkFileNameAtNum(1)) cond="kag.bookMarkDates[1] != void"]
[button graphic="nodata" cond="kag.bookMarkDates[1] == void"]
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