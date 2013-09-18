#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

export PATH=$PATH:/usr/local/heroku/bin:$HOME/.gem/ruby/2.0.0/bin
export GEM_HOME="~/.gem/ruby/2.0.0"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash/aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash/aliases ]; then
    source ~/.bash/aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Auto completion for Git command aliases.
. /usr/share/git/completion/git-completion.bash
if [ -f ~/.git/completion.bash ]; then
    . ~/.git/completion.bash
fi

# Use an existing SSH agent.
if [ ! -z `command -v ssh-add` ] ; then
    eval $(ssh-add)
elif [ ! -z `command -v keychain` ] ; then
    eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
fi
