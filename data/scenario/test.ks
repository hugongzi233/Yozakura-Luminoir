*test|Test空间
; ==========================
; 1-1
@playbgm storage="wbgm02.ogg"
@bg background="bg2" method="universal" rule="ysr025" vague=10 time=500
@stand face="bt2" layer=2 pos="c"
@rclick enabled=true

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