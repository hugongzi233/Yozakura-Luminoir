*test|Test空间
; ==========================
; 1-1
@playbgm storage="wbgm02.ogg"
@bg background="bg1"
@showmsg

@stand face="bt1" layer=1 pos="lc"

@n name="女孩" se="alic0063.ogg"
你这个整天无所事事、[ruby text="龌龊变态"]油腻肮脏、[font size=30 color=0xFF3300]不修边幅[resetfont]，只会对着电脑屏幕傻笑的白痴给我去死！[p]

*choose1-1|我决定了!...
@showbtn
@locate x=90 y=100
@button graphic="select" text="我想继续跟你一起走下去" color=0xffffff size=26 offset=77 target="*win"

@wait time=100 canskip=false

@locate x=90 y=210
@button graphic="select" text="对不起，我拒绝" color=0xffffff size=26 offset=40 target="*lose"
@s

*win
@clearbtn
@showmsg
@clearstand layer=1 effect=false
@stand face="bt2" layer=1 pos="lc"

@n name="女孩" se="alic0008.ogg"
这个鬼东西怎么这么难学啊！！！[r]我要放弃了！[p]

@clearstand layer=2 effect=false
@clearstand layer=1 effect=false
@bg background="bg2" method="universal" rule="ysr025" vague=10 time=500
@stand face="bt2" layer=2 pos="c"

@n name="李四"
今天天气真不错！[p]
@n name=""
要一起去冒险吗？[p]

*lose
@clearbtn
@showmsg
@n name="恶魔"
哈哈哈，你失败了！[p]
@return