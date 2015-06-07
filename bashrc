if [ -f ~/.bash/aliases ]; then
    source ~/.bash/aliases
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Auto completion for Git command aliases.
. ~/.git/git-completion.bash
if [ -f ~/.git/completion.bash ]; then
    . ~/.git/completion.bash
fi

export EDITOR=$(which vim)
export VISUAL="$EDITOR"
export TERM=screen-256color
export PATH=$PATH:/usr/local/heroku/bin
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - --no-rehash)"
