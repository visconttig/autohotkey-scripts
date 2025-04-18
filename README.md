# AutoHotKey Scripts

This are just some AutoHotKey scripts that I personally use to increase my productivity, fix 'bugs' from Windows, Google Chrome, etc.

For example:

> To be able to have Google Chrome always on full-screen mode and resize automaticaly as I move my mouse to the edges.

> To have Vim navigation globally available (in any program).

> To disable or overwrite unused or simply undesired Windows built-in shortcuts / hotkeys.

> Etc, etc.

---

---

---

# 🖥️ AutoFullScreen Ninja 🥷

> `fullscreen-every-program.ahk`

_A sneaky little AHK script that toggles fullscreen based on your mouse habits._

## ✨ What is this sorcery?

This AutoHotKey (AHK) script is your productivity buddy that silently watches your mouse movements and _bam!_—throws your favorite apps into fullscreen like a ninja… and pulls them back when you're done. No more fumbling with `F11` like it's a secret handshake.

Designed to work with:

- 🧭 Google Chrome (`chrome.exe`)
- 🛠️ Visual Studio Code (`Code.exe`)
- 🧠 Anki (`Anki.exe`)

You chill. It fullscreens.

---

## 🧠 How It Works

Here's what this script does, in plain English:

1. **Keeps an eye** 👁️ on your active window.
2. If you're using Chrome, Code, or Anki (grouped under `programs`), it starts watching your mouse like a hawk.
3. If your mouse stays still for 1 second (`idle = 1000ms`), it fullscreens the app (presses `F11`).
4. If you move your mouse near the top/bottom of the screen (`margin = 10px`) _and_ you're in fullscreen, it pulls you out (again with `F11`).
5. You can manually toggle this whole script on/off with `F11` or `F2`.

Yes, it’s that smooth.

---

## 🚀 How To Use It

### 🔧 Prerequisites

- Install [AutoHotKey](https://www.autohotkey.com/).
- Be on Windows.
- Have the urge to automate your life.

### 📦 Setup

1. Save the script as something like `AutoFullScreen.ahk`.
2. Run it by double-clicking.
3. Want it to start every time you boot? The script takes care of that too!

   ```ahk
   FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%A_ScriptName%.lnk, %A_ScriptDir%
   ```

   That magical line auto-creates a shortcut to your Startup folder. So yes, it launches with Windows. 🎉

---

## 💡 Pro Tips

- 🐭 Don't worry about every little mouse wiggle—there's a `tolerance` value (4 pixels) to ignore minor movements.
- 🔇 You’ll hear beeps when it starts watching (`1500 Hz`) and stops (`1000 Hz`). Like a sonar ping. 🐋
- 💾 It checks every `350ms` when the app is active, so it’s responsive without being annoying.
- 🔘 Press `F11` or `F2` to pause/resume the script if you need a break from fullscreen mode mania.

---

## 🤖 Full Script Breakdown

<details>
<summary>Click to view the full code</summary>

```ahk
; This should be at the **top** level
GroupAdd, programs, ahk_exe chrome.exe
GroupAdd, programs, ahk_exe Code.exe
GroupAdd, programs, ahk_exe Anki.exe

; Auto-launch on startup
FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%A_ScriptName%.lnk, %A_ScriptDir%

#SingleInstance Force
#InstallMouseHook
Process, Priority,, B

idle      = 1000 ; Milliseconds to wait before entering full screen
margin    = 10   ; Screen boundaries for exiting full screen
tolerance = 4    ; Mouse distance to ignore in full screen

Loop {
    WinWaitActive, ahk_group programs
    SoundBeep, 1500
    SetTimer, Check, 350
    WinWaitNotActive
    SetTimer, Check, Off
    SoundBeep, 1000
}

#IfWinNotActive ahk_exe FreeTimer.exe
Check:
CoordMode, Mouse
lastX := x, lastY := y
MouseGetPos, x, y
WinGetPos,,, w, h, A
full     := w = A_ScreenWidth && h = A_ScreenHeight
moved    := Max(Abs(x - lastX), Abs(y - lastY)) > tolerance
inMargin := y < margin || y > A_ScreenHeight - margin
Send % !full && A_TimeIdleMouse > idle || full && inMargin && moved ? "{F11}" : ""

~F11::Pause, Toggle
return
~F2::Pause, Toggle
return
```

</details>

---

## 🧪 Why This Is Cool

- **Saves you time.** No more fumbling with `F11` manually.
- **Boosts focus.** When your app is fullscreen, you're less likely to tab away.
- **Smooth AF.** Transitions feel natural, intuitive, and responsive.

---

## 🐞 Known Quirks

- Doesn’t play well with _every_ app—just the ones you list in the `GroupAdd`.
- Some apps handle fullscreen differently, so results may vary.
- If your cat walks across your mousepad, it may toggle fullscreen. 🐈

---

## 🙌 Contributions & Kudos

Feel free to fork, modify, suggest cool ideas, or just say hi. This is just a fun automation project for people who love clean screens and smooth workflows.

---

## 🧙‍♂️ License

Do whatever you want with it. Just don’t sell it to wizards without letting me know.

---

---

---

# 🔤 Keyboard Layout Indicator (AutoHotkey v1)

> `ShowKeyboardLayout.ahk`

A lightweight, floating GUI script that **displays your current keyboard layout** in real time, with **custom colors** per layout. Built in AutoHotkey v1.

Ideal for:

- Keyboard layout switchers (e.g. QWERTY, Colemak, Dvorak, etc.)
- Multilingual typists
- Anyone who wants a visual layout reminder always on screen

---

## ✨ Features

- 🔄 Auto-updates every 500ms to reflect the current layout
- 🎨 Color-coded text and background based on layout
- 🖼️ Always-on-top floating GUI (no taskbar icon)
- ⌨️ Toggle GUI visibility with `F8`
- 🚀 Option to autostart with Windows (adds shortcut to Startup folder)

---

## 💻 Supported Layouts (customizable)

Sometimes the native layout code is different, in that case, you'll see the raw code instead of the abbreviation or name defined.

> Simply copy the displayed code into the **_map_**.

| Layout Code | Label     | Background | Text Color |
| ----------- | --------- | ---------- | ---------- |
| `F0010409`  | US_Int    | Black      | White      |
| `F0D30409`  | US_Clmk   | Red        | White      |
| `080A580A`  | Spa_LA    | Gray       | White      |
| `08040804`  | Chn_Simpl | Black      | Gray       |

> You can add more layouts or customize labels/colors in the `layoutMap` inside the script.

---

## 🚀 Getting Started

### ✅ Requirements

- [AutoHotkey v1.x](https://www.autohotkey.com/) (not v2)

### 🧠 How to Use

1. **Clone or download** the repo
2. Open the script with AutoHotkey
3. Switch keyboard layouts — watch the floating label update instantly!

#### To toggle the GUI display:

> Press `F8`

#### To enable autostart:

Uncomment the following line in the script to create a startup shortcut:

```ahk
FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%A_ScriptName%.lnk, %A_ScriptDir%
```

### 🛠 Customization

- Add new layouts:

  > Edit the layoutMap dictionary in the script.

- Change font, position, size:

  > Look inside the `CreateGui()` function.
  >
  > > Change position via the `Gui, Show, x10 y10` line.
  > > Adjust font, size, or color via `Gui, Font` and `Gui, Add`.

- Modify colors or text per layout:
  > Tweak `textColor` and `bgColor` in the map.

### 📸 Screenshot

(--- pending ---)

### 🧾 License

MIT — do what you like with it!

```

```
