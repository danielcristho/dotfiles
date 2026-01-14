# Yazi Configuration

Modern terminal file manager with vim-like keybindings. Adapted from macOS dotfiles for Ubuntu 24.04.

## Installation

```bash
# Install Rust (if not installed)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install yazi
cargo install --locked yazi-fm yazi-cli

# Install optional dependencies
sudo apt install -y ffmpegthumbnailer unar jq poppler-utils fd-find ripgrep fzf zoxide imagemagick

# Symlink config
mkdir -p ~/.config/yazi
ln -sf ~/dotfiles/yazi/yazi.toml ~/.config/yazi/yazi.toml
ln -sf ~/dotfiles/yazi/theme.toml ~/.config/yazi/theme.toml
```

## Usage

```bash
# Start yazi
yazi

# Or add alias to .zshrc
alias y="yazi"
```

## Key Bindings

### Navigation
- `h/j/k/l` - Navigate (vim-style)
- `g` - Go to top
- `G` - Go to bottom
- `[` / `]` - Previous/next sibling directory

### File Operations
- `Space` - Select file
- `v` - Visual mode (select multiple)
- `y` - Copy
- `x` - Cut
- `p` - Paste
- `d` - Delete
- `r` - Rename
- `n` - Create new file
- `N` - Create new directory

### View
- `Tab` - Toggle preview
- `z` - Toggle hidden files
- `s` - Sort menu
- `f` - Filter
- `/` - Search

### Open
- `Enter` - Open file/directory
- `o` - Open with default app
- `e` - Edit with nvim

### Other
- `q` - Quit
- `?` - Help
- `~` - Go to home
- `.` - Toggle hidden files

## Features

- Vim-like keybindings
- File preview (images, videos, code)
- Fuzzy search
- Bulk operations
- Gruvbox theme
- Neovim integration
- Fast performance (written in Rust)

## Preview Support

Yazi can preview:
- Text files (with syntax highlighting)
- Images (with thumbnails)
- Videos (with thumbnails)
- PDFs
- Archives
- JSON/YAML
- Markdown

## Integration with Zsh

Add to `.zshrc`:

```bash
# Yazi cd on quit
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
```

This allows yazi to change directory when you quit.
