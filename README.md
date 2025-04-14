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

# Vim Navigation

> `VimNavigation.ahk`

This script brings **Vim-style navigation** to your Windows environment using [AutoHotKey](https://www.autohotkey.com/). If you've never used [Vim](https://www.vim.org/) before — don't worry! This README walks you through every hotkey and concept you need to use this like a pro.

## 📦 What is This?

A lightweight, customizable AutoHotKey script that lets you move around and edit text like a keyboard ninja — using only your keyboard and simple hotkeys.

It mimics **Vim's navigation style**, but without needing to use Vim at all. This script works in any text field, editor, or app on Windows.

---

## 🚀 Getting Started

### 1. Install AutoHotKey

- Download and install AutoHotKey from [https://www.autohotkey.com](https://www.autohotkey.com)

### 2. Run the Script

- Save this script with a `.ahk` extension
- Double-click the file to run it
- To auto-run it at startup, include this line near the top of the script:
  ```autohotkey
  FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%A_ScriptName%.lnk, %A_ScriptDir%
  ```

---

## 🧠 What’s "Vim Mode"?

In Vim (a terminal-based text editor), there's a concept of **"modes"**:

- **Normal mode** — navigate and manipulate text
- **Insert mode** — type text normally
- **Visual mode** — select text

This script mimics **Normal mode** using hotkeys, but in _any_ Windows app.

---

## 🧷 Activating Vim Mode

You enter "Vim Mode" with:

| Key                   | Action                            |
| --------------------- | --------------------------------- |
| **Double-tap `Esc`**  | Enters Vim Mode (Normal mode)     |
| **Double-tap `Ctrl`** | Also enters Vim Mode (custom mod) |

> ✅ A small on-screen popup will show "VIM Mode" when activated.

---

## ❌ Exiting Vim Mode

| Key       | Action                                              |
| --------- | --------------------------------------------------- |
| `Esc`     | Exits Vim Mode                                      |
| `Ctrl`    | Also exits Vim Mode (custom mod)                    |
| `i`       | Exits Vim Mode, like entering “Insert Mode” in Vim  |
| `Shift+i` | Moves to the start of the line, then exits Vim Mode |
| `a`       | Moves one character forward, then exits Vim Mode    |
| `Shift+a` | Moves to end of line, then exits Vim Mode           |

---

## 🧭 Navigation Hotkeys

When Vim Mode is active, use these:

### Basic Movement

| Key | Moves the cursor… |
| --- | ----------------- |
| `h` | Left              |
| `j` | Down              |
| `k` | Up                |
| `l` | Right             |

### Word/Line Movement

| Key        | Action                 |
| ---------- | ---------------------- |
| `w`        | Move forward one word  |
| `b`        | Move backward one word |
| `0`        | Move to start of line  |
| `$` or `-` | Move to end of line    |

---

## ✂️ Edit / Delete / Copy / Paste

| Key  | Action                      |
| ---- | --------------------------- |
| `x`  | Delete character            |
| `+x` | Shift+X → Delete and select |
| `d`  | Cut (Ctrl+X)                |
| `y`  | Copy (Ctrl+C)               |
| `p`  | Paste (Ctrl+V)              |

---

## ⌨️ Selection / Visual Mode

| Key  | Action                   |
| ---- | ------------------------ |
| `+h` | Select left              |
| `+j` | Select down              |
| `+k` | Select up                |
| `+l` | Select right             |
| `+w` | Select forward one word  |
| `+b` | Select backward one word |
| `)`  | Select to line start     |
| `_`  | Select to line end       |

---

## 🔁 Repeating Actions

| Key | Action                              |
| --- | ----------------------------------- |
| `.` | Repeats the last action (like redo) |

---

## 🔢 Repeating Commands with Numbers

Prefix a movement or edit command with a number to repeat it:

| Example | Meaning             |
| ------- | ------------------- |
| `5j`    | Move down 5 lines   |
| `3x`    | Delete 3 characters |

Numbers are typed before the command while in Vim Mode. You can chain digits like `2`, then `3` to mean 23.

---

## 🔍 Other Hotkeys

| Key | Action                    |
| --- | ------------------------- |
| `/` | Search (opens Ctrl+F)     |
| `u` | Undo (Ctrl+Z)             |
| `>` | Indent line (Tab)         |
| `<` | Unindent line (Shift+Tab) |

---

## 🎮 Alternate Mode: Spacebar Navigation

You can also press and hold `Space` + a key (like a game controller!) to quickly move around:

| Combo       | Action           |
| ----------- | ---------------- |
| `Space + h` | Left             |
| `Space + j` | Down             |
| `Space + k` | Up               |
| `Space + l` | Right            |
| `Space + w` | Next word        |
| `Space + b` | Previous word    |
| `Space + x` | Delete character |
| `Space + 0` | Line start       |
| `Space + -` | Line end         |
| `Space + u` | Undo (Ctrl+Z)    |
| `Space + i` | Rename file (F2) |

> This mode works instantly — no need to enter full Vim Mode.

---

## 🧼 Reset & Cleanup

Behind the scenes, the script:

- Resets the internal number tracking after each command
- Shows popups for command repetition (e.g. `25j` to move 25 lines down)
- Safely disables VIM-mode when needed

---

## 💡 Tips

- You can customize any key combo — the script is open and editable
- You can also remap other keys like CapsLock to toggle Vim mode

---

## 🙏 Credits

- Original by Jongbin Jung
- Inspired by Model_Vim.ahk by Rich Alesi
- Modified for AHK_L by Andrej Mitrovic

---

## 🛠️ Troubleshooting

- If hotkeys don’t work, make sure AutoHotKey is running
- Some apps may override keyboard input (try Notepad or VSCode first)

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
