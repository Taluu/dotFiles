#
# My aliases
#

alias git="LANGUAGE=en_US.UTF-8 \"git\""
alias vim="LANGUAGE=en_US.UTF-8 \"nvim\""
alias ls="LANGUAGE=en_US.UTF-8 \"ls\""

unalias gm
# unalias ag

# disable fucking composer warning
alias composer="COMPOSER_DISABLE_XDEBUG_WARN=1 composer"

# thefuck alias
if [[ -x ~/.local/bin/thefuck ]]; then
    alias fuck='eval $(~/.local/bin/thefuck $(fc -ln -1 | tail -n 1)); fc -R'
fi
