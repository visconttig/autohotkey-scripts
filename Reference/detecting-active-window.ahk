#Persistent
#SingleInstance

#IfWinActive, ahk_exe Code.exe
m::
MsgBox, 'Visual Studio Code is active.'
;Suspend, On
return

#IfWinNotActive
;Suspend, Off
m::
MsgBox, 'Ya are not in Visual Studio Code.'
return 
