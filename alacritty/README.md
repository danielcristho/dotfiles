# Alacritty Configuration

GPU-accelerated terminal emulator with Gruvbox Material theme and transparency.

## Features

- Gruvbox Material Medium Dark theme
- Transparent background with blur effect (opacity 0.85)
- CaskaydiaMono Nerd Font
- Import external theme files
- Custom keybindings

## Quick Start

```bash
# Install via main script
~/dotfiles/install

# Or manually
ln -sf ~/dotfiles/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -sf ~/dotfiles/alacritty/gruvbox-material-alacritty.yml ~/.config/alacritty/gruvbox-material-alacritty.yml
```

## Configuration

Current setup:
- **Version**: v0.16.1 (TOML format)
- **Theme**: Gruvbox Material Medium Dark
- **Opacity**: 0.85
- **Blur**: Enabled
- **Font**: CaskaydiaMono Nerd Font, 14pt

## Transparency

Transparency is configured in `alacritty.toml`:

```toml
[window]
opacity = 0.85  # 0.0 (transparent) to 1.0 (opaque)
blur = true     # Blur effect
```

Recommended values:
- `0.95` - Subtle
- `0.85` - Balanced (default)
- `0.75` - More transparent
- `0.60` - Very transparent

## Theme Variants

The `gruvbox-material-alacritty.yml` includes 6 variants:

**Dark:**
- `gruvbox_material_hard_dark` - Darkest
- `gruvbox_material_medium_dark` - Default
- `gruvbox_material_soft_dark` - Softer

**Light:**
- `gruvbox_material_hard_light`
- `gruvbox_material_medium_light`
- `gruvbox_material_soft_light`

To switch, edit `gruvbox-material-alacritty.yml` last line:
```yaml
colors: *gruvbox_material_medium_dark
```

## Keybindings

- `Ctrl+Shift+C` - Copy
- `Ctrl+Shift+V` - Paste
- `Ctrl+Shift+N` - New window
- `Ctrl++` - Increase font
- `Ctrl+-` - Decrease font
- `Ctrl+0` - Reset font
- `F11` - Fullscreen

## Troubleshooting

### Transparency not working

1. Check compositor (Unity/GNOME uses Mutter - should work)
2. Try higher transparency: `opacity = 0.5`
3. Disable Zellij auto-start (can block transparency)
4. Restart Alacritty completely

### Theme not loading

1. Verify theme file is linked:
   ```bash
   ls -la ~/.config/alacritty/gruvbox-material-alacritty.yml
   ```
2. Check import in `alacritty.toml`:
   ```toml
   import = ["~/.config/alacritty/gruvbox-material-alacritty.yml"]
   ```

### Update Alacritty

```bash
cargo install alacritty
```

## References

- [Alacritty](https://alacritty.org/)
- [Gruvbox Material](https://github.com/sainnhe/gruvbox-material)
