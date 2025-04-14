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
