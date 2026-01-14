# Alacritty Configuration

Modern, GPU-accelerated terminal emulator configuration with Gruvbox theme.

## Features

- **Theme**: Gruvbox Dark
- **Font**: CaskaydiaMono Nerd Font (14pt)
- **Opacity**: 95% for subtle transparency
- **Shell**: Zsh with login shell
- **Cursor**: Blinking beam style
- **Scrollback**: 10,000 lines

## Installation

1. **Install Alacritty**:
```bash
sudo apt install alacritty
```

2. **Install Nerd Font**:
```bash
# Download and install CaskaydiaMono Nerd Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/CascadiaMono.zip
unzip CascadiaMono.zip
fc-cache -fv
```

3. **Symlink config**:
```bash
mkdir -p ~/.config/alacritty
ln -sf ~/dotfiles/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
```

## Keyboard Shortcuts

| Key | Action |
|-----|--------|
| `Ctrl+Shift+C` | Copy |
| `Ctrl+Shift+V` | Paste |
| `Ctrl+Shift+N` | New window |
| `F11` | Toggle fullscreen |
| `Ctrl++` | Increase font size |
| `Ctrl+-` | Decrease font size |
| `Ctrl+0` | Reset font size |

## Customization

### Change Font Size
Edit `alacritty.toml`:
```toml
[font]
size = 14.0  # Change this value
```

### Change Opacity
```toml
[window]
opacity = 0.95  # 0.0 (transparent) to 1.0 (opaque)
```

### Change Theme
Replace the `[colors]` section with your preferred theme.

Popular alternatives:
- **Tokyo Night**: Dark blue theme
- **Nord**: Cool blue-grey theme
- **Dracula**: Purple-pink theme

### Change Font
```toml
[font.normal]
family = "Your Font Name"
```

Available Nerd Fonts:
- JetBrainsMono Nerd Font
- FiraCode Nerd Font
- Hack Nerd Font
- RobotoMono Nerd Font

## Troubleshooting

### Font not found
```bash
# List available fonts
fc-list | grep -i "nerd"

# Rebuild font cache
fc-cache -fv
```

### Colors look wrong
Make sure your terminal supports true color:
```bash
echo $TERM  # Should be xterm-256color
```

### Alacritty won't start
Check config syntax:
```bash
alacritty --print-events
```

## Integration

Works seamlessly with:
- Zsh + Oh My Zsh
- Starship prompt
- Zellij multiplexer
- Neovim with Gruvbox theme
