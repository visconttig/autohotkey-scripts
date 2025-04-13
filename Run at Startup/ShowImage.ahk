#SingleInstance Force                                       ; One instance
make_gui()                                                  ; Create the gui

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

; part of 'makeUi' method
Return




make_gui() {
    Static pic_path := "C:\Users\visco\MEGASync\---windows--apps-settings\AutoHotKey Scripts\assets\colemak-keyboard-layout.png"               ; Path to the pic
         , key       := "F7"                                ; Key you want to use to hide/show
         , key_send  := false                               ; True if you want key to still fire
    
    Gui, New, +AlwaysOnTop -Caption +HWNDgui_hwnd +Border   ; New window (gui) to host the image
    Gui, Margin, 0, 0                                       ; Set default margin size
    Gui, Add, Picture, +HWNDpic_hwnd, % pic_path            ; Add picture to gui
    OnMessage(0x0201, "WM_LBUTTONDOWN")                     ; Allows for click+drag moving
    
    bf := Func("toggle_gui").bind(gui_hwnd, 1, pic_hwnd)    ; Create boundfunc for key down
    Hotkey, % (key_send ? "~" : "") "*" key, % bf           ; Create key down hotkey to show image
    bf := Func("toggle_gui").bind(gui_hwnd, 0)              ; Create boundfunc for key up
    Hotkey, % (key_send ? "~" : "") "*" key " Up", % bf     ; Create key up hotkey to hide image\
}

toggle_gui(hwnd, key_state, pic_hwnd:="") {                 ; Handles toggling window view
    Gui, % HWND ":" (key_state ? "Show" : "Hide")
}

WM_LBUTTONDOWN(wParam, lParam, msg, hwnd) {                 ; Handles click+dragging
    SendMessage, 0x00A1, 0x2
}

