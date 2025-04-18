#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance force
#Persistent

#UseHook On
DetectHiddenWindows, On
SetWinDelay, 0
SetControlDelay, 0
;SetTimer, WatchWindowChanges, 300

lastTitle := ""

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

ShowShortcut(action, shortcut) {
    text := action " : " shortcut
    GuiControl,, ShortcutText, %text%

    StringLen, len, text
    newW := len * 12 + 20
    newH := 34

    GuiControl, Move, ShortcutText, w%newW% h%newH%
    Gui, Show, NoActivate Center AutoSize
    SetTimer, HideGui, -2000
}

HideGui:
    Gui, Hide
return

; ---------------------------
; Passive Observers
; ---------------------------

; Clipboard actions (detect copy/paste via mouse/menu)
; OnClipboardChange:
;     if (A_EventInfo = 1)
;         ShowShortcut("Copy Detected", "Try Ctrl+C next time!")
; return

; Window / Tab watcher (e.g., new Chrome tab)
; WatchWindowChanges:
;     WinGetActiveTitle, currentTitle
;     if (currentTitle != lastTitle) {
;         if InStr(currentTitle, "New Tab") {
;             ShowShortcut("New Tab Detected", "Use Ctrl+T")
;         } else if InStr(currentTitle, "Incognito") {
;             ShowShortcut("Incognito Window", "Use Ctrl+Shift+N")
;         }
;         lastTitle := currentTitle
;     }
; return

; ---------------------------
; Essential Keyboard Shortcuts (unchanged)
; ---------------------------
; ~^t:: ShowShortcut("New Tab", "Ctrl+T")
; ~^n:: ShowShortcut("New Window", "Ctrl+N")
; ~^w:: ShowShortcut("Close Tab", "Ctrl+W")
; ~^+t:: ShowShortcut("Reopen Closed Tab", "Ctrl+Shift+T")
; ~^Tab:: ShowShortcut("Next Tab", "Ctrl+Tab")
; ~^+Tab:: ShowShortcut("Previous Tab", "Ctrl+Shift+Tab")
; ~^l:: ShowShortcut("Focus Address Bar", "Ctrl+L")
; ~^j:: ShowShortcut("Downloads", "Ctrl+J")
; ~^h:: ShowShortcut("History", "Ctrl+H")
; ~^r:: ShowShortcut("Refresh", "Ctrl+R")
; ~^+r:: ShowShortcut("Force Refresh", "Ctrl+Shift+R")
; ~^k:: ShowShortcut("Search from Address Bar", "Ctrl+K")
; ~^e:: ShowShortcut("Search from Address Bar", "Ctrl+E")
; ~^+n:: ShowShortcut("Incognito Mode", "Ctrl+Shift+N")
; ~^0:: ShowShortcut("Reset Zoom", "Ctrl+0")
; ~^+:: ShowShortcut("Zoom In", "Ctrl++")
; ~^-:: ShowShortcut("Zoom Out", "Ctrl+-")

; ~!Tab:: ShowShortcut("Switch App", "Alt+Tab")
; ~#Left:: ShowShortcut("Snap Left", "Win+←")
; ~#Right:: ShowShortcut("Snap Right", "Win+→")
; ~#Up:: ShowShortcut("Maximize", "Win+↑")
; ~#Down:: ShowShortcut("Minimize", "Win+↓")
; ~#e:: ShowShortcut("File Explorer", "Win+E")
; ~#r:: ShowShortcut("Run", "Win+R")
; ~#l:: ShowShortcut("Lock Screen", "Win+L")
; ~#d:: ShowShortcut("Show Desktop", "Win+D")
; ~#Tab:: ShowShortcut("Task View", "Win+Tab")

; ~^c:: ShowShortcut("Copy", "Ctrl+C")
; ~^v:: ShowShortcut("Paste", "Ctrl+V")
; ~^x:: ShowShortcut("Cut", "Ctrl+X")
; ~^z:: ShowShortcut("Undo", "Ctrl+Z")
; ~^y:: ShowShortcut("Redo", "Ctrl+Y")
; ~^a:: ShowShortcut("Select All", "Ctrl+A")
; ~^f:: ShowShortcut("Find", "Ctrl+F")
; ~^s:: ShowShortcut("Save", "Ctrl+S")
; ~^p:: ShowShortcut("Print", "Ctrl+P")

;~MButton:: ShowShortcut("Close Tab (Mouse)", "Ctrl+W")
~RButton:: ShowShortcut("Context Menu", "Shift+F10")
;~XButton1:: ShowShortcut("Back", "Alt+←")
;~XButton2:: ShowShortcut("Forward", "Alt+→")
