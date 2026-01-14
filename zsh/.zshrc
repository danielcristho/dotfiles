# Zsh Configuration
# Oh My Zsh based configuration for Ubuntu

# Path to your oh-my-zsh installation
export ZSH=~/.oh-my-zsh

# Theme
ZSH_THEME="amuse"

# Enable command auto-correction
ENABLE_CORRECTION="true"

# History timestamp format
HIST_STAMPS="mm/dd/yyyy"

# Plugins
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Nord dircolor (optional)
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

# Language environment
export LANG=en_US.UTF-8

# Editor
export EDITOR='nvim'
export VISUAL='nvim'

# Common Aliases
alias cl="clear"

# Git Aliases
alias ga="git add"
alias gcm="git commit"
alias gp="git push"
alias gcl="git clone"
alias gpl="git pull"
alias gbr="git branch"
alias gck="git checkout"
alias lg="lazygit"

# Python Aliases
alias py="python3"

# Tmux Aliases
alias tx="tmux"
alias txn="tmux new -s"
alias txkl="tmux kill-session -t"

# Docker Aliases
alias dcd="docker compose down"
alias dcu="docker compose up --build -d"

# System Aliases
alias pwf="poweroff"
alias rbt="reboot"

# Directory Navigation
alias dw="cd ~/Downloads"
alias dc="cd ~/Documents"

# Development Aliases
alias cpp="g++"
alias tf="terraform"
alias y="yazi"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Google Cloud SDK (optional)
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then 
    . "$HOME/google-cloud-sdk/path.zsh.inc"
fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then 
    . "$HOME/google-cloud-sdk/completion.zsh.inc"
fi

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
#command -v pyenv >/dev/null && eval "$(pyenv init - zsh)"

# Go
export PATH=$PATH:$HOME/go/bin

# Neovim
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# Local bin
export PATH="$HOME/.local/bin:$PATH"

# Starship prompt
eval "$(starship init zsh)"

# Zellij auto-start
eval "$(zellij setup --generate-auto-start zsh)"

# Zoxide (smart cd)
eval "$(zoxide init zsh)"

# Local customizations (not tracked in git)
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
