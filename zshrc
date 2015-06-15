export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git)

# User configuration

source $ZSH/oh-my-zsh.sh

export EDITOR=$(command -v vim)
export VISUAL="$EDITOR"
export PATH=$PATH:/usr/local/heroku/bin
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - --no-rehash)"

source ~/.bash/aliases

fpath=(~/.zsh $fpath)
