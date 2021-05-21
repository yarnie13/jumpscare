;- not work = webm
SetWorkingDir, %A_ScriptDir%
extensions :="mp4,flv,vob,mpg,mkv"

FileSelectFile, f"ile, 2, D:\M_MEDIA\M_VIDEO, Select WMP Compatible File:%extensions%
if Errorlevel
   ExitApp
SplitPath,file, name, dir, ext, name_no_ext, drive
If Ext not In %extensions%
{
msgbox, 262208, ,Can't PLAY`n--------------`nExtension is not in %extensions% .
exitapp
}

";Gui, +LastFound +Resize
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
