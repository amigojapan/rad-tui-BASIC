# RAD-TUI 🖥️

**Rapid Application Development - Terminal User Interface**

A Visual Basic 1.0 for MS-DOS inspired visual IDE that runs on Linux. Design forms, place controls, write code, and run your applications - all in the terminal!

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows%20(WSL)-green.svg)
![Language](https://img.shields.io/badge/language-Python%20%7C%20FreeBASIC-orange.svg)
![Version](https://img.shields.io/badge/version-2.0.0-brightgreen.svg)

## 🎯 Concept

RAD-TUI recreates the magic of early 90s visual programming environments like VB1 for MS-DOS, but for modern Linux terminals. It provides:

- **Visual Form Designer** - Drag and drop controls onto forms
- **Property Editor** - Edit control properties in real-time
- **Code Editor** - Write Python code with syntax highlighting
- **Runtime Mode** - Test your applications instantly
- **Project Management** - Save and load projects as JSON files
- **Menu System** - Design menus with submenus
- **Event System** - Multiple event types (click, change, focus, timer, etc.)

## 🚀 Features (Version 2.0.0)

### Visual Design Environment
- 🖱️ **Mouse-driven interface** - Point, click, drag, and resize
- 🪟 **Draggable windows** - Move forms and toolboxes freely
- 🎨 **16 control types** including buttons, labels, text boxes, frames, and more
- 📐 **Visual resizing** - Grab handles to resize controls
- ✏️ **Property editing** - Edit names, captions, positions, and dimensions
- 📋 **Control parenting** - Place controls inside frames

### Code Development
- 🐍 **Python code-behind** - Write event handlers in Python
- 🌈 **Syntax highlighting** - Keywords, strings, numbers, and comments
- ▶️ **Runtime execution** - Run your forms with live code execution
- 🐛 **Runtime error display** - See errors in a message box
- 📝 **Code editor** - Modal editor with cursor navigation

### Event System
- **on_click** - Button and control clicks
- **on_change** - Value changes (text, selection, toggle)
- **on_focus** - Control receives focus
- **on_blur** - Control loses focus
- **on_timer** - Timer interval events
- **on_load** - Form initialization
- **on_menu** - Menu item selection

### Project Management
- 💾 **Save/Load projects** - JSON-based project files
- 📁 **File menu** - Standard save/load/exit operations
- 🔄 **Design/Runtime toggle** - Switch between design and test modes
- 📂 **Example projects** - 5 complete example applications

### Terminal Compatibility
- ✅ **UTF-8 support** - Automatic detection with ASCII fallback
- ✅ **Color support** - 256 colors with monochrome fallback
- ✅ **Mouse support** - Works in most modern terminals
- ✅ **Cross-platform** - Linux, macOS, Windows (WSL)

## 📁 Project Structure

```
radtui/
├── rad-tui-py.py              # Python/curses implementation (recommended)
├── rad-tui-py-compat.py      # Terminal-compatible version
├── rad-tui-BASIC.bas          # FreeBASIC implementation
├── examples/                  # Example projects
│   ├── hello_world.json       # Basic greeting application
│   ├── calculator.json        # Functional calculator
│   ├── text_editor.json       # Text editor with menus
│   ├── database_browser.json  # Data browser with navigation
│   ├── timer_demo.json        # Timer and animation demo
│   ├── README.md              # Examples documentation
│   └── QUICK_START.md         # Quick start guide
├── docs/                      # Documentation
│   ├── README.md              # Documentation index
│   ├── API_REFERENCE.md       # Complete API reference
│   ├── EVENT_HANDLING.md      # Event handling guide
│   ├── PROJECT_FORMAT.md      # JSON format specification
│   ├── PORTING_GUIDE.md       # VB1 DOS migration guide
│   └── TUTORIAL.md            # Step-by-step tutorial
├── tests/                     # Testing utilities
│   ├── test_terminal_compat.py    # Terminal compatibility tester
│   └── test_project_interchange.py # Project validation
├── HISTORY.md                 # Version history
├── TESTING.md                 # Testing guide
├── LICENSE                    # MIT License
└── README.md                  # This file
```

## 🎮 How to Run

### Python Version (Recommended)

**Standard version:**
```bash
# Requires Python 3.6+ and curses support
python3 rad-tui-py.py
```

**Terminal-compatible version** (best compatibility):
```bash
python3 rad-tui-py-compat.py
```

**Make executable:**
```bash
chmod +x rad-tui-py.py
./rad-tui-py.py
```

### FreeBASIC Version

```bash
# Compile with FreeBASIC:
fbc rad-tui-BASIC.bas -o rad-tui-BASIC

# Run the compiled binary:
./rad-tui-BASIC
```

### Running Example Projects

```bash
# Load an example project:
python3 rad-tui-py.py
# Then: File → Load Project → examples/hello_world.json
```

## 🕹️ User Guide

### Getting Started

When you run RAD-TUI, you'll see:
- A **Toolbox** on the left with available controls
- A **Form** window in the center (your design surface)
- A **Properties** window on the right

### Quick Start

1. **Add a button**: Click "Command Btn" in the toolbox, then click on the form
2. **Edit the caption**: Click in the Properties window, type a new caption
3. **Add code**: Double-click the button to open the code editor
4. **Write code**: Type: `def on_click_btn1(): msgbox("Hello!")`
5. **Run**: Click `[RUN ]` in the menu bar
6. **Test**: Click your button in the running application

### Available Controls

| Tool | Type | Description | Events |
|------|------|-------------|--------|
| Move/Size | - | Select and manipulate controls | - |
| Check Box | 1 | Boolean checkbox | on_change |
| Combo Box | 2 | Dropdown selection | on_change |
| Command Btn | 3 | Clickable button | on_click |
| Frame | 7 | Grouping container | - |
| Label | 9 | Static text display | - |
| List Box | 10 | Scrollable list | on_change |
| Option Btn | 11 | Radio button | on_change |
| Text Box | 13 | Text input field | on_change, on_focus, on_blur |
| Timer | 14 | Background timer | on_timer |

### Writing Code

Double-click a control to open the code editor. Example code:

```python
def on_click_btnSubmit():
    # Get input value
    name = txtName.caption
    
    # Validate
    if len(name) == 0:
        msgbox("Please enter your name")
        return
    
    # Update output
    txtOutput.caption = "Hello, " + name + "!"
    lblStatus.caption = "Greeting displayed"
```

**Special functions:**
- `msgbox(text)` - Display a message box
- Access controls by `name_id`: `txtName.caption`, `btnSubmit.caption`

### Menu System

1. In the Properties window, click "Click here to edit menu"
2. Press **A** to add a menu item
3. Enter caption and name ID
4. For submenus, answer **Y** when prompted
5. Press **ESC** to close the editor

### Keyboard Shortcuts

| Key | Action |
|-----|--------|
| `ESC` | Cancel / Exit dialog |
| `Enter` | Confirm / Save |
| `Tab` | Indent in code editor |
| Arrow keys | Navigate / Move controls |
| `A` | Add menu item (in menu editor) |
| `D` | Delete menu item (in menu editor) |

## 📚 Documentation

- **[QUICK_START.md](examples/QUICK_START.md)** - Get up and running quickly
- **[TUTORIAL.md](docs/TUTORIAL.md)** - Build your first application
- **[API_REFERENCE.md](docs/API_REFERENCE.md)** - Complete control and property reference
- **[EVENT_HANDLING.md](docs/EVENT_HANDLING.md)** - Event-driven programming guide
- **[PROJECT_FORMAT.md](docs/PROJECT_FORMAT.md)** - JSON project file specification
- **[PORTING_GUIDE.md](docs/PORTING_GUIDE.md)** - Migrate from VB1 DOS

## 📋 Example Projects

### Hello World
Basic greeting application demonstrating buttons and message boxes.

### Calculator
Functional calculator with buttons, text boxes, and mathematical operations.

### Text Editor
Multi-line text editor with menus, file operations, and line management.

### Database Browser
Customer database browser with list boxes, data binding simulation, and navigation.

### Timer Demo
Counter application with timer events, check boxes, and status updates.

## 📦 Project File Format

Projects are saved as JSON with this structure:

```json
{
  "x": 21, "y": 4, "w": 36, "h": 17,
  "title": "My Application",
  "menu_count": 1,
  "menu_items": [
    {"caption": "File", "name_id": "mnuFile", "parent": 0, "has_submenu": false}
  ],
  "controls": [
    {
      "x": 5, "y": 3, "w": 12, "h": 3,
      "tool_type": 3,
      "name_id": "btnOK",
      "caption": "OK",
      "code": "def on_click_btnOK():\\n    msgbox('Hello!')\\n",
      "checked": false,
      "group": "",
      "parent": 0,
      "items": [],
      "selected_index": -1,
      "scroll_offset": 0
    }
  ]
}
```

## 🛠️ Technical Details

### Python Implementation
- Uses `curses` library for terminal UI
- Supports mouse events (requires terminal with mouse support)
- Python syntax highlighting with regex tokenization
- Live code execution with `exec()` in controlled namespace
- Frame rate limiting for performance
- UTF-8 detection with ASCII fallback

### FreeBASIC Implementation
- Native console graphics using `fbgfx`
- Object-oriented design with Types
- Direct console manipulation with `Locate` and `Color`

## 📝 Requirements

### Python Version
- Python 3.6+
- Terminal with:
  - UTF-8 support (optional, has fallback)
  - Mouse support (optional, keyboard works too)
  - 80x24 minimum terminal size

### Supported Terminals
| Terminal | UTF-8 | Mouse | Colors | Status |
|----------|-------|-------|--------|--------|
| xterm | ✓ | ✓ | 256 | Full support |
| gnome-terminal | ✓ | ✓ | 256 | Full support |
| konsole | ✓ | ✓ | 256 | Full support |
| alacritty | ✓ | ✓ | 256 | Full support |
| tmux | ✓ | ✓ | 256 | Full support |
| screen | ✓ | ✗ | 256 | Limited mouse |
| Linux console | ✗ | ✗ | 8 | ASCII mode |

### FreeBASIC Version
- FreeBASIC compiler (`fbc`)
- Linux console

## 🧪 Testing

Run the test suite:
```bash
# Test project file interchange
python3 test_project_interchange.py

# Test terminal compatibility
python3 test_terminal_compat.py
```

See [TESTING.md](TESTING.md) for detailed testing procedures.

## 🐛 Troubleshooting

### UTF-8 Characters Not Displaying
```bash
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
```
Or use `rad-tui-py-compat.py` which has ASCII fallback.

### Mouse Not Working
```bash
export TERM=xterm-256color
```
Or use keyboard shortcuts instead.

### Colors Not Displaying
```bash
export TERM=xterm-256color
```

## 📜 License

This project is licensed under the **MIT License**.

See [LICENSE](LICENSE) for full details.

## 🙏 Acknowledgments

Inspired by:
- Microsoft Visual Basic 1.0 for MS-DOS (1992)
- The simplicity of early visual programming environments
- The enduring appeal of terminal-based applications

## 📞 Support

- Check the [documentation](docs/) for guides and references
- Review [example projects](examples/) for working code
- See [TUTORIAL.md](docs/TUTORIAL.md) for step-by-step instructions

---

**Happy retro-coding!** 🎉
