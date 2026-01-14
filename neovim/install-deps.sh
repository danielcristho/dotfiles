#!/usr/bin/env bash
set -e

echo "Installing Neovim dependencies..."
echo ""

# Check OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if command -v apt &> /dev/null; then
        PKG_MANAGER="apt"
    elif command -v dnf &> /dev/null; then
        PKG_MANAGER="dnf"
    elif command -v pacman &> /dev/null; then
        PKG_MANAGER="pacman"
    else
        echo "Unsupported package manager"
        exit 1
    fi
else
    echo "This script is for Linux only"
    exit 1
fi

# Install system dependencies
echo "Installing system packages..."
if [[ "$PKG_MANAGER" == "apt" ]]; then
    sudo apt update
    sudo apt install -y build-essential gcc ripgrep xclip curl git
elif [[ "$PKG_MANAGER" == "dnf" ]]; then
    sudo dnf install -y gcc make ripgrep xclip curl git
elif [[ "$PKG_MANAGER" == "pacman" ]]; then
    sudo pacman -S --noconfirm base-devel gcc ripgrep xclip curl git
fi

# Install Python dependencies
echo "Installing Python packages..."
pip3 install --user pynvim greenlet

# Install vim-plug
echo "Installing vim-plug..."
if [[ ! -f "${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim" ]]; then
    curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "vim-plug installed"
else
    echo "vim-plug already installed"
fi

# Backup existing config
if [[ -d "$HOME/.config/nvim" ]] && [[ ! -L "$HOME/.config/nvim" ]]; then
    echo "Backing up existing Neovim config..."
    mv "$HOME/.config/nvim" "$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Create symlink
echo "Creating symlink..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ln -sf "$SCRIPT_DIR/.config/nvim" "$HOME/.config/nvim"

echo ""
echo "✅ Dependencies installed!"
echo ""
echo "Next steps:"
echo "1. Open Neovim: nvim"
echo "2. Install plugins: :PlugInstall"
echo "3. Restart Neovim"
echo ""
echo "📚 Check README.md and CHEATSHEET.md for usage guide"
