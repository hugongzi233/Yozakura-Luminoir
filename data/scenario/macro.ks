; ==============================================================================
; Macro Definitions
; ==============================================================================
;
; [set_stand]
;   Show character stand (tachie).
;   Arguments:
;     face   : Image filename (required)
;     layer  : Layer number (default: 1)
;     pos    : Position (l, lc, c, rc, r)
;     method : Transition method (default: crossfade)
;     time   : Transition time (default: 300)
;
; [set_background]
;   Show background image.
;   Arguments:
;     background : Image filename (required)
;     method     : Transition method (default: crossfade)
;     time       : Transition time (default: 400)
;
; [show_message_window]
;   Show the message window (dialogue box).
;   Arguments: None
;
; [clear_message_window]
;   Hide the message window.
;   Arguments:
;     effect : If true, use transition (default: false)
;
; [set_name] / [nm]
;   Set the speaker's name. [nm] also redraws the name area.
;   Arguments:
;     name : Speaker name
;
; [nm_off]
;   Clear the speaker's name.
;
; [clear_stand]
;   Clear character stand.
;   Arguments:
;     layer : Layer number (default: 1)
;
; [clear_bg]
;   Clear background.
;
; [set_window_title]
;   Set the game window title.
;   Arguments:
;     title : Title string
;
; [bgm] / [bgm_stop]
;   Play/Stop background music.
;   Arguments:
;     delay : Delay time before playing/stopping
;
; [fade_out] / [fade_in]
;   Fade to black / Fade in from black.
;
; [shake]
;   Screen shake effect.
;
; [w]
;   Wait command shortcut.
;
; ==============================================================================

*macro|macro
@position layer=message0 page=back frame=""
@position layer=message1 page=fore frame=""
@current layer=message0 page=back
@er

; ------------------------------------------------------------------------------
; Graphic Macros
; ------------------------------------------------------------------------------

[macro name=set_stand]
@backlay
@image layer=%layer|1 page=back storage=%face visible=true left=0 top=0 pos=%pos
@trans method=%method|crossfade rule=%rule vague=%vague time=%time|300
@wt
[endmacro]

[macro name=set_background]
@backlay
@image layer=base page=back storage=%background visible=true left=0 top=0 opacity=255
@trans method=%method|crossfade rule=%rule vague=%vague time=%time|400
@wt
[endmacro]

[macro name=clear_stand]
@freeimage layer=%layer|1 page=back
@trans method=%method|crossfade rule=%rule vague=%vague time=%time|300
@wt
[endmacro]

[macro name=clear_bg]
@freeimage layer=base page=back
@trans method=%method|crossfade rule=%rule vague=%vague time=%time|500
@wt
[endmacro]

; ------------------------------------------------------------------------------
; Message Window Macros
; ------------------------------------------------------------------------------

[macro name=show_message_window]
@position layer=message0 left=0 top=&(720-160) width=1280 height=160 marginl=200 margint=0 marginr=70 marginb=16 opacity=0 visible=true frame="frame" page=back
@trans method=crossfade time=800
@wt
[endmacro]

[macro name=clear_message_window]
@position layer=message0 frame="" page=back
@trans method=crossfade time=800 cond="mp.effect==true"
@wt
[endmacro]

; ------------------------------------------------------------------------------
; Name & Text Macros
; ------------------------------------------------------------------------------

[macro name=set_name]
@eval exp='f.currentName = mp.name'
[endmacro]

[macro name=_draw_name]
@current layer=message0 page=fore
@font face="黑体" size=24
@er
[nowait]
[if exp="f.currentName !== void && f.currentName != ''"]
@emb exp="'【'+f.currentName+'】'"
@r
[else]
　
@r
[endif]
[endnowait]
@resetfont
[endmacro]

[macro name=nm]
[eval exp="f.currentName = mp.name"]
@_draw_name
[endmacro]

[macro name=nm_off]
[eval exp="f.currentName = ''"]
@_draw_name
[endmacro]

[macro name=p]
@l
@_draw_name
[endmacro]

; ------------------------------------------------------------------------------
; Button Macros
; ------------------------------------------------------------------------------

[macro name=show_btn]
@backlay
@position layer=message1 page=back visible=true opacity=0 top=0 height=720 left=0 width=1280 marginl=0 margint=0 marginr=0 marginb=0
@current layer=message1 page=back
@er
@trans method=%method|crossfade rule=%rule vague=%vague time=%time|800
[endmacro]

[macro name=clear_btn]
@position layer=message1 frame="" page=back
@trans method=%method|crossfade rule=%rule vague=%vague time=%time|500
@wt
@current layer=message0 page=back
[endmacro]

; ------------------------------------------------------------------------------
; System Macros
; ------------------------------------------------------------------------------

[macro name="set_window_title"]
[eval exp='System.title = mp.title']
[endmacro]

[macro name="set_window_subtitle"]
@set_window_title title='&f.windowTitle + " " + &mp.subtitle'
[endmacro]

[macro name="set_full_screen"]
[eval exp='System.setFullScreen(mp.fullscreen)']
[endmacro]

[macro name="se"]
@playse *
[endmacro]

[macro name="bgm"]
[if exp="mp.delay !== void"]
@stopbgm
@w time=%delay
[endif]
@playbgm storage=%storage loop=true
[endmacro]

[macro name="bgm_stop"]
[if exp="mp.delay !== void"]
@stopbgm
@w time=%delay
[endif]
@stopbgm
[endmacro]

; ------------------------------------------------------------------------------
; Effect Macros
; ------------------------------------------------------------------------------

[macro name="fade_out"]
@backlay
@position layer=2 page=back visible=true opacity=255 left=0 top=0 width=1280 height=720 color=0x000000
@trans method=crossfade time=%time|1000
@wt
[endmacro]

[macro name="fade_in"]
@backlay
@layopt layer=2 page=back visible=false
@trans method=crossfade time=%time|1000
@wt
[endmacro]

[macro name="shake"]
@quake time=%time|300 vmax=%vmax|10 hmax=%hmax|10
@wt
[endmacro]

[macro name="w"]
@wait time=%time mode=%mode|normal
[endmacro]

@return

