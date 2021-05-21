SetWorkingDir, %A_ScriptDir%
; Settings:
width:=1366														; Width of picture.
height:=800														; Height of picture.
displayTimes:=[4000,4000,4000,2000]								; Times to display image1,...,image4. In ms, 1 second = 1000 ms
;pictureNames:=["vid1.mp4", "pic2.jpg", "pic3.jpg", "pic4.jpg"]	; Pictures names, put them in the same folder as this script
transLevel:=140							; Change 140 to adjust transparancy level, 0 is invisible, 255 is opaque (no transparancy).
;FileSelectFile, file, 1, "\vid1.mp4"
file := A_WorkingDir . "\vid1.mp4"

; Hotkeys
;Hotkey, !tab, toggleOff, On				; Hotkey for toggle off overlay
;Hotkey, F2, transToggle, On				; Hotkey for toggle transparancy on/off
;Hotkey, F3, moveOverlay, On				; Hotkey for enable move of overlay

;Hotkey, If, off							; Do not change this line
;Hotkey, !tab, toggleOn					; Hotkey for toggle on overlay
;Hotkey, If								; Do not change this line

; End settings

off:=1
trans:=255

; Creates the overlay
;Gui, -caption +ToolWindow +HWNDguiID +AlwaysOnTop
;Gui, add, picture, x0 y0 w%width% h%height% hwndPic, img1.jpg
;Gui, Show, hide w%width% h%height%

;Gui, +LastFound +Resize
#t::
Gui,2:Color,Black
Gui,2:Color,ControlColor, Black
Gui,2: Add, ActiveX,x25 y25 w1400 h800 vWMP, WMPLayer.OCX
WMP.Url := file
WMP.uiMode := "none"                   ; no WMP controls
WMP.stretchToFit := 1                  ; video is streched to the given activex range
WMP.enableContextMenu := 0             ; no reaction to right click in the video field
WMP.settings.setMode("loop", true)
Gui,2: Show, w1450 h850 Center, Player GUI
return
2GuiClose:
ExitApp
