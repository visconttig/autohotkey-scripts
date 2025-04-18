;; This is the working version***

#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#Persistent
#SingleInstance Force

;================================================
; COPY SCRIPT TO StartUp FOLDER FOR AUTORUNNING
;put this line near the top of your script: 
FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%A_ScriptName%.lnk, %A_ScriptDir% 
;=============================================

; ---------------------------
; Setup GUI
; ---------------------------
Gui, +AlwaysOnTop -Caption +ToolWindow +LastFound
Gui, Margin, 10, 10
Gui, Color, Black
Gui, Font, cWhite s12 bold, Arial
Gui, Add, Text, vShortcutText Center

; Allow GUI to be draggable
Gui +E0x02000000  ; WS_EX_COMPOSITED
Gui, Add, Text, vMoveHandle w0 h0  ; invisible handle
OnMessage(0x201, "StartDrag")  ; make draggable
StartDrag(wParam, lParam, msg, hwnd) {
    PostMessage, 0xA1, 2,,, A
}

; ---------------------------
; Load last shortcut on startup
; ---------------------------
IniRead, lastShortcut, shortcut.ini, Settings, LastShortcut, 
if (lastShortcut != "") {
    GuiControl,, ShortcutText, %lastShortcut%
    StringLen, len, lastShortcut
    newW := len * 12 + 20

    newH := 34
    GuiControl, Move, ShortcutText, w%newW% h%newH%
    Gui, Show, Center AutoSize
} else {
    Gui, Show, Center AutoSize ; Show with a default message if no shortcut has been saved
}

; ---------------------------
; Shortcut Selection Dialog
; ---------------------------
~^+c::  ; Ctrl + Shift + C
    choice1 := "New Tab > Ctrl+T"
    choice2 := "New Window > Ctrl+N"
    choice3 := "Close Tab > Ctrl+W"

    list =
    (
1. %choice1%
2. %choice2%
3. %choice3%
    )

    InputBox, selectedChoice, Choose a Shortcut, Select a shortcut by number:`n`n%list%, , 300, 200

    if (selectedChoice = "1")
        chosen := choice1
    else if (selectedChoice = "2")
        chosen := choice2
    else if (selectedChoice = "3")
        chosen := choice3
    else
        return

    ; Save to file
    IniWrite, %chosen%, shortcut.ini, Settings, LastShortcut

    ; Show on GUI
    GuiControl,, ShortcutText,
    GuiControl,, ShortcutText, %chosen%
    StringLen, len, chosen
    newW := len * 12 + 20
    newH := 34
    GuiControl, Move, ShortcutText, w%newW% h%newH%
    Gui, Show, Center AutoSize
return
