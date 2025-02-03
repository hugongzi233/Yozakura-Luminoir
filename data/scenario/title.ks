*title
@stoptrans
;@waitclick
;@playbgm storage="start.wav"
@fadeinbgm storage="start.wav"
@position layer=message0 page=back visible=true opacity=0 top=0 height=720 left=0 width=1280 marginl=0 margint=0 marginr=0 marginb=0 frame="opbg"
@current layer=message0 page=back
@deffont face="黑体" size=26 color=0xffffff rubysize=16 rubyoffset=0
@er
@locate x=600 y=370
@button graphic="start" target="*new"

@locate x=200 y=370
@button graphic="btn" text="一段文字" color=0xffffff size=16 target="*testsave"
@trans method=crossfade time=800
@wt
@s

*new
@jump storage="test.ks" target="*test"
; @jump storage="c1-1.ks" target="*c1-1"

*testsave
@jump storage="testsave.ks" target="*testsave"