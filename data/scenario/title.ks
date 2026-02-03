*title|标题界面
@stoptrans
;@waitclick
;@playbgm storage="start.wav"
@fadeinbgm storage="mainpage.ogg"

@SetBackground background="opbg" method=crossfade time=1000
@deffont face="黑体" size=26 color=0xffffff rubysize=16 rubyoffset=0
@er
@locate x=600 y=370
[link target=*new]选择支１[endlink][r]

@locate x=200 y=370
@button graphic="btn" color=0xffffff size=16 target="*new"
@trans method=crossfade time=800
@wt
@s

*new
@jump storage="c1-1.ks" target="*c1-1"