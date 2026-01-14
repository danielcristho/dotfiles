# Zsh Configuration

Oh My Zsh based shell configuration with Starship prompt.

## Installation

```bash
# Install Zsh
sudo apt install zsh

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Link config
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc

# Set as default shell
chsh -s $(which zsh)
```

## Features

- Oh My Zsh framework
- Starship prompt
- Syntax highlighting
- Auto-suggestions
- Git integration
- Zellij auto-start
- Zoxide (smart cd)

## Local Customizations

Create `~/.zshrc.local` for personal aliases and settings that shouldn't be tracked in git:

```bash
# ~/.zshrc.local example

# Personal directory aliases
alias work="cd ~/work/projects"
alias personal="cd ~/personal"

# SSH aliases
alias server="ssh user@server.com"

# Custom environment variables
export MY_API_KEY="secret"
```

This file is automatically sourced if it exists and is ignored by git.

## Integrated Tools

### Starship
Modern prompt with git status, language versions, etc.

### Zellij
Terminal multiplexer that auto-starts with zsh.

### Zoxide
Smart cd command. Use `z <directory>` to jump to frequently used directories.

### NVM
Node Version Manager for managing Node.js versions.

### Pyenv
Python version manager.

## Customization

### Change Theme
Edit `.zshrc`:
```bash
ZSH_THEME="robbyrussell"  # or any Oh My Zsh theme
```

### Add Plugins
Edit `.zshrc`:
```bash
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  docker  # add more plugins
)
```

### Disable Zellij Auto-start
Comment out in `.zshrc`:
```bash
# eval "$(zellij setup --generate-auto-start zsh)"
```
