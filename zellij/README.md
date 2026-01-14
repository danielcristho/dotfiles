# Zellij Configuration

Terminal multiplexer with vim-style keybindings and Gruvbox theme.

## Features

- Vim-style navigation (hjkl)
- Multiple panes and tabs
- Session management
- Gruvbox Dark theme
- Tmux-compatible mode

## Transparency Note

Zellij renders its own UI layer which can block terminal transparency. If you need transparent terminal:

### Option 1: Test without Zellij

```bash
# Comment out auto-start in ~/.zshrc
# eval "$(zellij setup --generate-auto-start zsh)"

# Restart terminal to see Alacritty transparency
```

### Option 2: Launch Zellij manually

```bash
# Disable auto-start in ~/.zshrc
# Launch Zellij only when needed:
zellij
```

### Option 3: Use tmux instead

Tmux generally works better with terminal transparency:

```bash
# Install tmux
sudo apt install tmux

# Use tmux aliases from .zshrc
tx      # Start tmux
txn     # New session
```

## Keybindings

### Mode Switching

- `Ctrl+p` - Pane mode
- `Ctrl+t` - Tab mode
- `Ctrl+n` - Resize mode
- `Ctrl+s` - Scroll mode
- `Ctrl+o` - Session mode
- `Ctrl+g` - Lock mode
- `Ctrl+b` - Tmux mode

### Pane Mode (Ctrl+p)

- `h/j/k/l` - Move focus
- `n` - New pane
- `d` - New pane down
- `r` - New pane right
- `x` - Close pane
- `f` - Toggle fullscreen
- `z` - Toggle pane frames

### Tab Mode (Ctrl+t)

- `n` - New tab
- `x` - Close tab
- `h/l` - Previous/next tab
- `r` - Rename tab
- `1-9` - Go to tab number

### Resize Mode (Ctrl+n)

- `h/j/k/l` - Increase size
- `H/J/K/L` - Decrease size
- `+/-` - Increase/decrease

### Quick Actions (No mode switch)

- `Alt+n` - New pane
- `Alt+h/j/k/l` - Move focus
- `Alt+[/]` - Swap layout

## Session Management

```bash
# List sessions
zellij list-sessions

# Attach to session
zellij attach session-name

# Create named session
zellij -s my-session

# Detach (in session)
Ctrl+o then d
```

## Theme

Uses Gruvbox Dark theme. To change theme, edit `config.kdl`:

```kdl
theme "gruvbox-dark"
```

Available themes in `/usr/share/zellij/themes/` or `~/.config/zellij/themes/`

## Installation

```bash
# Link config
ln -sf ~/dotfiles/zellij/config.kdl ~/.config/zellij/config.kdl

# Restart terminal
```

## Troubleshooting

### Auto-start not working

Check if line exists in `~/.zshrc`:

```bash
eval "$(zellij setup --generate-auto-start zsh)"
```

### Transparency blocked

Zellij UI blocks terminal transparency. See "Transparency Note" section above.

### Keybindings not working

Make sure you're in the correct mode. Press `Esc` to return to normal mode.

## References

- [Zellij Documentation](https://zellij.dev/)
- [Zellij GitHub](https://github.com/zellij-org/zellij)
