*start
[rclick enabled=false]
;关闭右键
[clickskip enabled=false]
;关闭点击跳过
[history enabled=false output=false]
;关闭对话会放的开启和记录，不然按了鼠标滚轮就会开启对话回放
[playbgm storage="start"]
;这句是播放音乐，请随便在bgm文件夹里放一首你喜欢的音乐把它命名为start吧，注意根据音乐格式修改config.tjs里边的BGM_config，如果是mp3，ogg类的音乐就写type = "Wave"，因为mp3和ogg是用插件播放的，播放插件在func.ks里边已经进行载入了，这里可以直接使用

[position layer=message0 page=back visible=true opacity=0 top=0 height=720 left=0 width=1280 marginl=0 margint=0 marginr=0 marginb=0 frame="opbg"]
[current layer=message0 page=back]
[deffont face="黑体" size=20 color=0xffffff]
[er]
[locate x=600 y=370][button graphic="start" storage="open.ks" target=*open]
[trans method=crossfade time=800][wt]
[s]