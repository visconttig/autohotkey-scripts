#SingleInstance
;================================================
; COPY SCRIPT TO StartUp FOLDER FOR AUTORUNNING
;put this line near the top of your script: "Menu, tray, add, Auto Start, startwithwindows?"
;StartWithWindows?:
;   MsgBox, 4,, Would you like this program to start with Windows? (press Yes or No)
;  IfMsgBox Yes
; {
FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%A_ScriptName%.lnk, %A_ScriptDir% ;create one
;;MsgBox,,%title%, You pressed Yes`n`nWill start automatically,1
;} ;     MsgBox You pressed Yes.
;else
;{
;   Filedelete, %A_Startup%\%A_ScriptName%.lnk
;  MsgBox,,Actioned, You pressed No.`nThis program will not start automatically,1
;}
;Return

; -------------------

ChangeBrightness(100)
Sleep, 100
;ChangeBrightness(50)
ChangeBrightness(0)
Sleep, 100
return

ChangeBrightness( ByRef brightness := 50, timeout = 1 )
{
    if ( brightness >= 0 && brightness <= 100 )
    {
        For property in ComObjGet( "winmgmts:\\.\root\WMI" ).ExecQuery( "SELECT * FROM WmiMonitorBrightnessMethods" )
            property.WmiSetBrightness( timeout, brightness )
    }
    else if ( brightness > 100 )
    {
        ;brightness := 100
        brightness := 0
    }
    else if ( brightness < 0 )
    {
        brightness := 0
    }
}


#IfWinNotActive ahk_exe Code.exe
^b::
  ChangeBrightness(100)
  return
^+b::
    ChangeBrightness(0)
    return

^h::
    ChangeBrightness(brightness += 2)
    return
^j:: 
    ChangeBrightness(brightness -= 2)
