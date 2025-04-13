#NoEnv
#Persistent
#SingleInstance force
SetBatchLines, -1

global GuiIsOpen := true
CreateGui()

;================================================
; COPY SCRIPT TO StartUp FOLDER FOR AUTORUNNING
;put this line near the top of your script: "Menu, tray, add, Auto Start, startwithwindows?"
;kStartWithWindows?:
;   MsgBox, 4,, Would you like this program to start with Windows? (press Yes or No)
;    IfMsgBox Yes
;   {
    FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%A_ScriptName%.lnk, %A_ScriptDir% ;create one
    ;   MsgBox,,%title%, You pressed Yes`n`nWill start automatically,1
    ;   } ;     MsgBox You pressed Yes.
    ;    else
    ;   {
    ;      Filedelete, %A_Startup%\%A_ScriptName%.lnk
    ;     MsgBox,,Actioned, You pressed No.`nThis program will not start ;; ;automatically,1
    ;  }
    ;Return
    
    ; --------------
;=============================================

;Create a small GUI to show layout name
; Gui, +AlwaysOnTop +ToolWindow -SysMenu -Caption
; Gui, Font, s18 Bold, Arial
; Gui, Color, Black
; Gui, Add, Text, vLayoutText cWhite, Loading...
; Gui, Show, x1425 y295 NoActivate, Keyboard Layout

;;;; Testing
CreateGui(){
    global
    ; Create a small GUI to show layout name
Gui, +AlwaysOnTop +ToolWindow -SysMenu -Caption
Gui, Font, s18 Bold, Arial
Gui, Color, Black
Gui, Add, Text, vLayoutText cWhite, Loading...
Gui, Show, x1425 y295 NoActivate, Keyboard Layout
}


; Update layout name every half-second
SetTimer, UpdateLayoutName, 500
return

; UpdateLayoutName:
;     layoutHex := GetKeyboardLayoutHex()
;     ; Read friendly name from registry
;     regKey := "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\" . layoutHex
;     RegRead, layoutName, %regKey%, Layout Text

;     if (ErrorLevel || layoutName = "")
;         layoutName := layoutHex  ; fallback to showing layout hex

;     GuiControl,, LayoutText, %layoutName%
; return

;;;; Second version {{{
UpdateLayoutName:
    layoutHex := GetKeyboardLayoutHex()

    ; Map known layout codes to friendly names
    layoutMap := {}
    ;layoutMap["00020409"] := "United States - International"
    layoutMap["F0010409"] := "US_Int"
    ;layoutMap["00030409"] := "United States - Colemak"
    layoutMap["F0D30409"] := "US_Clmk"
    ;layoutMap["0000040A"] := "Spanish - Latin America"
    layoutMap["080A580A"] := "Spa_LA"
    ;layoutMap["E00E0804"] := "Chinese - Simplified"
    layoutMap["08040804"] := "Chn_Simpl"


    if (layoutMap.HasKey(layoutHex))
        layoutName := layoutMap[layoutHex]
    else {
        ; Read friendly name from registry as fallback
        regKey := "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts\" . layoutHex
        RegRead, layoutName, %regKey%, Layout Text
        if (ErrorLevel || layoutName = "")
            layoutName := layoutHex
    }

    GuiControl,, LayoutText, %layoutName%
return

; }}}


GetKeyboardLayoutHex()
{
    ; Get foreground window and thread ID
    WinGet, hwnd, ID, A
    threadID := DllCall("GetWindowThreadProcessId", "UInt", hwnd, "UInt*", 0)
    hkl := DllCall("GetKeyboardLayout", "UInt", threadID)
    
    ; Convert HKL to an 8-digit hex string
    layoutHex := Format("{:08X}", hkl & 0xFFFFFFFF)
    return layoutHex
}

GuiClose:
ExitApp

F8::ToggleGui()


ToggleGui(){
    if (GuiIsOpen) {
        GuiIsOpen := false
        Gui, Destroy
       ; MsgBox, Destroying view
    } else {
        GuiIsOpen := true
        CreateGui()
       ; MsgBox, Creating view
    }
}



