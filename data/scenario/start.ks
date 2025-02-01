*start
[rclick enabled=false]
;关闭右键
[clickskip enabled=false]
;关闭点击跳过
[history enabled=false output=false]
;关闭对话会放的开启和记录，不然按了鼠标滚轮就会开启对话回放
; [playbgm storage="start"]
@playbgm storage="start.wav"
[position layer=message0 page=back visible=true opacity=0 top=0 height=720 left=0 width=1280 marginl=0 margint=0 marginr=0 marginb=0 frame="opbg"]
[current layer=message0 page=back]
[deffont face="黑体" size=20 color=0xffffff]
[er]
[locate x=600 y=370][button graphic="start" storage="open.ks" target=*open]
[trans method=crossfade time=800][wt]
[s]