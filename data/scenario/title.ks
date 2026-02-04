;--------------------------------------------------
; title.ks - 标题画面
;--------------------------------------------------
*title|标题画面
@stoptrans
@clearsysvar
@clickskip enabled=true
@rclick enabled=false

@freeimage layer=base
; 播放BGM前先判断当前是否已经是该BGM，避免重复播放导致重头开始
[if exp="kag.bgm.currentStorage != 'mainpage.ogg'"]
@bgm storage="mainpage.ogg" loop=true
[endif]

*title_ui
@rclick enabled=false
@image layer=base page=back storage="opbg"

; --------------------------------------------------------------------------
; 按钮绘制 (Message 1)
; --------------------------------------------------------------------------
@position layer=message1 page=back visible=true opacity=0 left=0 top=0 width=1280 height=720 marginl=0 margint=0 marginr=0 marginb=0 frame=""
@current layer=message1 page=back
@er

; 继续游戏
@locate x=1000 y=180
@button graphic="sys_config_bt_sound_DELETE" target="*func_continue" enterse="hito_ge_kawaugoki08" clickse="hito_ge_kawaugoki07" recthit=true

; 开始游戏
@locate x=1000 y=250
@button graphic="sys_config_bt_sound_DELETE" target="*func_start" enterse="hito_ge_kawaugoki08" clickse="hito_ge_kawaugoki07" recthit=true

; 读取游戏
@locate x=1000 y=320
@button graphic="sys_config_bt_sound_DELETE" target="*func_load" enterse="hito_ge_kawaugoki08" clickse="hito_ge_kawaugoki07" recthit=true

; 鉴赏模式
@locate x=1000 y=390
@button graphic="sys_config_bt_sound_DELETE" target="*func_gallery" enterse="hito_ge_kawaugoki08" clickse="hito_ge_kawaugoki07" recthit=true

; 系统设置
@locate x=1000 y=460
@button graphic="sys_config_bt_sound_DELETE" target="*func_config" enterse="hito_ge_kawaugoki08" clickse="hito_ge_kawaugoki07" recthit=true

; 退出游戏
@locate x=1000 y=530
@button graphic="sys_config_bt_sound_DELETE" target="*func_exit" enterse="hito_ge_kawaugoki08" clickse="hito_ge_kawaugoki07" recthit=true

@trans method=crossfade time=800
@wt

; 切换到前台
@current layer=message1 page=fore
@s

;--------------------------------------------------
; 功能跳转
;--------------------------------------------------
*func_continue
@call storage="save.ks" target="*start"
@jump target="*title_ui"

*func_start
@rclick enabled=true call="" target="" jump=false
@layopt layer=message1 page=fore visible=false
@jump storage="c1-1.ks" target="*c1-1"

*func_load
; @eval exp="tf.mode = 'load'"
@call storage="load.ks" target="*start"
@jump target="*title_ui"

*func_gallery
@eval exp="System.inform('鉴赏模式尚未实装')"
@jump target="*title_ui"

*func_config
; 跳转到自定义设置页面
@call storage="config.ks" target="*start"
@jump target="*title_ui"
@s

*func_exit
@eval exp="kag.onExitMenuItemClick(kag)"
@s
