*c1-1|吸...吸血鬼!
; ==========================
; 1-1
@disablestore store=false

@set_window_subtitle subtitle='吸...吸血鬼!'
@bgm storage="mitisugara.ogg"
@set_background background="温泉旅馆入口_未处理.png"
@show_message_window

@nm name="池原"
今天也是"社畜浓度"超标的一天。
[p]
我叫池原一郎，是一家广告公司的普通职员。[l][r]
为了公司那笔生死攸关的投资，我像个廉价的陪酒机器人一样，对着那位满面油光的老板笑了整整六个小时。
[p]
六个小时啊。[l][r]
脸颊的肌肉已经不再是自己的了，大概这辈子都恢复不了了吧。
[p]
结束了...终于结束了...
[p]
@nm_off
算了，至少这家新开的温泉旅馆房间不错。温泉...温泉在等着我...
[p]
@set_background background="温泉旅馆宿舍_未处理.png"
衬衫脱掉...西裤脱掉...终于解放了——
[p]
@nm name="池原"
「泡温泉！泡温泉！」
[p]

@se storage="sei_ge_srai_door_op01.ogg"
@set_background background="温泉旅馆宿舍庭院_莉亚_未处理.png" time=1000
@stopbgm time=500
@bgm storage="rest.ogg"

@nm name="？？？"
「——诶？」
[p]
@nm name="池原"
「——诶？」
[p]
@nm_off
（蒸汽中，娇小的人影）
[p]
（银白色的长发，浮在水面上的...肩膀？）
[p]
（还有——）
[p]
@nm name="？？？"
「呀啊啊啊啊啊——！！！」
[p]
@nm name="池原"
「——诶？你听我解释啊！」
[p]
; 拖鞋