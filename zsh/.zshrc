export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git docker python vscode)
source $ZSH/oh-my-zsh.sh

export PATH="/opt/homebrew/bin:$PATH"

alias gst='git status'
alias gco='git checkout'
alias dcup='docker-compose up'
alias dps='docker ps'
