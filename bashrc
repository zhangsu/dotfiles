if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -f ~/.bash/aliases ]; then
    source ~/.bash/aliases
fi

if [ -f ~/.git/completion.bash ]; then
    . ~/.git/completion.bash
fi
if [ -f ~/.bash/git-completion.bash ]; then
. ~/.bash/git-completion.bash
fi

export EDITOR=$(command -v vim)
export VISUAL="$EDITOR"
export TERM=screen-256color
export PATH=$PATH:/usr/local/heroku/bin
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - --no-rehash)"
