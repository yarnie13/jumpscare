SetWorkingDir, %A_ScriptDir%
; Settings:
width:=1366														; Width of picture.
height:=800														; Height of picture.
displayTimes:=[4000,4000,4000,2000]								; Times to display image1,...,image4. In ms, 1 second = 1000 ms
pictureNames:=["img1.jpg", "pic2.png", "pic3.png", "pic4.png"]	; Pictures names, put them in the same folder as this script
transLevel:=140							; Change 140 to adjust transparancy level, 0 is invisible, 255 is opaque (no transparancy).

; Hotkeys
Hotkey, F1, toggleOff, On				; Hotkey for toggle off overlay
Hotkey, F2, transToggle, On				; Hotkey for toggle transparancy on/off
Hotkey, F3, moveOverlay, On				; Hotkey for enable move of overlay

Hotkey, If, off							; Do not change this line
Hotkey, F1, toggleOn					; Hotkey for toggle on overlay
Hotkey, If								; Do not change this line

; End settings

off:=1
trans:=255

; Creates the overlay
Gui, -caption +ToolWindow +HWNDguiID +AlwaysOnTop
Gui, add, picture, x0 y0 w%width% h%height% hwndPic, pic1.png
Gui, Show, hide w%width% h%height%

return
; Hotkey labels
transToggle:
	WinSet, Transparent, % trans:= trans=255 ? transLevel:255 , ahk_id %guiID%		
return

moveOverlay:
	WinSet, Style, ^0xC00000, ahk_id %guiID%
return

toggleOff:
	Gui, show, hide
	off:=1
return

toggleOn:
	Gui, show
	off:=0
	Loop
	{
		picNum:=mod(A_Index-1,4)+1
		GuiControl,,%Pic%, % pictureNames[picNum]
		t:=A_TickCount
		while (A_TickCount-t<displayTimes[picNum] && !off)
			Sleep,250 ; Lowering this value will increase responsiveness of the toggle. Also, if there are issues with the timing, try lower this or modify displayTimes. Lower values will tax you cpu more, but values down to 50 will probably be no problems for a modern computer.
	} until off
return
#If off ; Needed for context sensitive hotkey command.
#If