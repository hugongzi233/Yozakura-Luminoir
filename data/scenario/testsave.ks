*testsave
[rclick enabled=false]
;[layopt layer=1 visible=false]
[layopt layer=message0 visible=true opacity=100]
[button name=save graphic=btn text="保存" size=26 x=50 y=0 exp="kag.callExtraConductor('testsave.ks','*save')"]
[image storage="bg2" layer=1 page=fore visible=true]
*setting
[eval exp="tf.x = [20,440,860,20,440,860]"]
[eval exp="tf.y = [137,137,137,262,262,262]"]
*play
[position layer=message1 page=fore left=0 top=500 width=800 height=100 marginl=0 margint=0 marginr=0 marginb=0 opacity=200 visible=true]
[current layer=message1]
;[sysbutton name=save normal=inGame_Save1 x=600 y=0 exp="kag.callExtraConductor('first.ks','*save')"]
1
[p]
2
[p]
3
[p]
4
[p]
5
[p]
6
[p]
7
[p]
[s]
*save
[locksnapshot]
[position layer=message2 page=back left=0 top=0 width=800 height=600 marginl=0 margint=0 marginr=0 marginb=0 opacity=200 visible=true]
*save0
[current page=back layer=message2]
[er]
;[locate x="100" y="500"]
[sysbutton name=back normal=back2 x="100" y="500" exp="kag.callExtraConductor('first.ks','*return')"]
[nowait]
[font face="黑体" size=18 color=0xffffff]
[locate x=10 y=5]
;first save
[locate x=10 y=30]
[button normal=&(kag.getBookMarkFileNameAtNum(0)) cond="kag.bookMarkDates[0]!=void" target=*load1]
[button normal="nodata" cond="kag.bookMarkDates[0] == void"]
[locate x=180 y=50]
[link target=*savedata1]
[emb exp="kag.bookMarkDates[0]" cond="kag.bookMarkDates[0]!=void"]
[emb exp="'--------------'" cond="kag.bookMarkDates[0]==void"]
[endlink]
;second save
[locate x=10 y=180]
[button normal=&(kag.getBookMarkFileNameAtNum(1)) cond="kag.bookMarkDates[1] != void" target=*load2]
[button normal="nodata" cond="kag.bookMarkDates[1] == void"]
[locate x=180 y=200]
[link target=*savedata2]
[emb exp="kag.bookMarkDates[1]" cond="kag.bookMarkDates[1] != void"]
[emb exp="'--------------'" cond="kag.bookMarkDates[1] == void"]
[endlink]
[endnowait]
[trans method=crossfade time=800][wt]
;[rclick jump=true target=*drclick enabled=true]
[s]
*savedata1
[save place=0 ask=false]
[jump target=*save0]
*savedata2
[save place=1 ask=false]
[jump target=*save0]
*load1
[load place=0 ask=false]
[s]
*load2
[load place=1 ask=false]
[s]
*return
[layopt layer=message2 visible=false page=back]
[return]