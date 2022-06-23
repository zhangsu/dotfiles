export ZSH=~/.oh-my-zsh

ZSH_THEME="random"

plugins=(vi-mode git gitfast extract)

# User configuration

source $ZSH/oh-my-zsh.sh

bindkey '^r' history-incremental-search-backward

[[ $TMUX = "" ]] && export TERM="xterm-256color"
export KEYTIMEOUT=1
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR=$(command -v vim)
export VISUAL="$EDITOR"
export PATH=$PATH:/usr/local/heroku/bin
export SAUCE_USERNAME=zhangsu

source ~/.bash/aliases

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
