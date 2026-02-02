*c1-1|吸...吸血鬼!
; ==========================
; 1-1
@playbgm storage="mitisugara.ogg"
@SetBackground background="bg1"
@ShowMessageWindow

@SetStand face="bt1" layer=1 pos="lc"

@n name="女孩" se="alic0063.ogg"
你这个整天无所事事、[ruby text="龌龊变态"]油腻肮脏、[font size=30 color=0xFF3300]不修边幅[resetfont]，只会对着电脑屏幕傻笑的白痴给我去死！[p]

@ClearStand layer=1 effect=false

@SetStand face="bt2" layer=2 pos="lc" method="universal" rule="ysr000" vague=100 time=100
@n name="女孩" se="alic0008.ogg"
这个鬼东西怎么这么难学啊！！！[r]我要放弃了！[p]

@ClearStand layer=2 effect=false
@ClearStand layer=1 effect=false

@playbgm storage="rest.ogg"

@SetBackground background="bg2" method="universal" rule="ysr031" vague=10 time=500
@SetStand face="bt2" layer=2 pos="c"

@n name="女孩" se="alic0063.ogg"
你这个整天无所事事、[ruby text="龌龊变态"]油腻肮脏、[font size=30 color=0xFF3300]不修边幅[resetfont]，只会对着电脑屏幕傻笑的白痴给我去死！[p]

@ClearStand layer=1 effect=false

@SetStand face="bt2" layer=2 pos="lc"
@n name="女孩" se="alic0008.ogg"
这个鬼东西怎么这么难学啊！！！[r]我要放弃了！[p]
[click]