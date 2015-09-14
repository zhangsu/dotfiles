export ZSH=~/.oh-my-zsh

ZSH_THEME="random"

plugins=(vi-mode git gitfast)

# User configuration

source $ZSH/oh-my-zsh.sh

bindkey '^r' history-incremental-search-backward

[[ $TMUX = "" ]] && export TERM="xterm-256color"
export EDITOR=$(command -v vim)
export VISUAL="$EDITOR"
export PATH=$PATH:/usr/local/heroku/bin
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - --no-rehash)"

source ~/.bash/aliases
