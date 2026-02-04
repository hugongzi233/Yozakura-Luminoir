; ==============================================================================
; Load Screen
; ==============================================================================

*start
@stoptrans
@rclick target="*back" jump=true enabled=true
[iscript]
// Ensure menu is initialized
if(typeof global.saveLoadMenu == "undefined") Scripts.execStorage("MySaveLoad.tjs");

// Show Menu
global.saveLoadMenu.show('load');
[endscript]
@trans method=crossfade time=300
@wt
@s

; ------------------------------------------------------------------------------
; Page Redraw Handler (for Tabs)
; ------------------------------------------------------------------------------
*draw_page
[iscript]
// tf.page is set by the button click
global.saveLoadMenu.drawPage(tf.page);
[endscript]
@trans method=crossfade time=300
@wt
@s

; ==============================================================================
; Logic Handlers
; ==============================================================================

*back
@rclick call="" target="" jump=false enabled=true
[iscript]
global.saveLoadMenu.cleanup();
[endscript]
@return
