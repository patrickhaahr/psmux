# pmux

A PowerShell-focused terminal multiplexer inspired by tmux, written in Rust for Windows.

> **Note:** pmux is designed specifically for Windows with PowerShell. It also installs as `tmux` so you can use familiar tmux commands!

## Features

- Split panes horizontally and vertically
- Multiple windows with tabs
- Session management (attach/detach)
- Mouse support for resizing panes
- Copy mode with vim-like keybindings
- Synchronized input to multiple panes
- **tmux alias included** - use `tmux` or `pmux` interchangeably

## Requirements

- Windows 10/11
- PowerShell 5.1+ or PowerShell Core 7+

## Installation

### Using Cargo (Recommended)

```powershell
cargo install pmux
```

This installs both `pmux` and `tmux` binaries, so you can use either command.

### Using Scoop

```powershell
scoop bucket add extras
scoop install pmux
```

### Using Winget

```powershell
winget install marlocarlo.pmux
```

### Using Chocolatey

```powershell
choco install pmux
```

### From Binary Release

Download the latest release from [GitHub Releases](https://github.com/marlocarlo/pmux/releases).

### From Source

```powershell
git clone https://github.com/marlocarlo/pmux.git
cd pmux
cargo install --path .
```

## Usage

You can use either `pmux` or `tmux` - they are identical:

```powershell
# Start a new session
pmux
# or
tmux

# Start a named session
pmux new-session -s mysession
tmux new-session -s mysession

# List sessions
pmux ls
tmux ls

# Attach to a session
pmux attach -t mysession
tmux attach -t mysession
```

## Key Bindings

The default prefix key is `Ctrl+b` (like tmux).

| Key | Action |
|-----|--------|
| `Prefix + c` | Create new window |
| `Prefix + %` | Split pane left/right (horizontal) |
| `Prefix + "` | Split pane top/bottom (vertical) |
| `Prefix + x` | Kill current pane |
| `Prefix + z` | Toggle pane zoom |
| `Prefix + n` | Next window |
| `Prefix + p` | Previous window |
| `Prefix + 0-9` | Select window by number |
| `Prefix + d` | Detach from session |
| `Prefix + ,` | Rename current window |
| `Prefix + w` | Window/pane chooser |
| `Prefix + [` | Enter copy mode |
| `Prefix + ]` | Paste from buffer |
| `Prefix + q` | Display pane numbers |
| `Prefix + Arrow` | Navigate between panes |
| `Ctrl+q` | Quit pmux |

## Configuration

Create a config file at `~/.pmux.conf`:

```
# Change prefix key to Ctrl+a
set -g prefix C-a

# Enable mouse
set -g mouse on

# Customize status bar
set -g status-left "[#S]"
set -g status-right "%H:%M"

# Cursor style: block, underline, or bar
set -g cursor-style bar
set -g cursor-blink on
```

## Why pmux?

- **Native Windows support** - No WSL or Cygwin required
- **PowerShell integration** - Works seamlessly with PowerShell
- **tmux compatibility** - Use the same commands you already know
- **Lightweight** - Single binary, no dependencies

## License

MIT