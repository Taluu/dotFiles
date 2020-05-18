# Allow comments
set -k

# history
HISTSIZE=10000
SAVEHIST=$HISTSIZE

source $HOME/antigen.zsh
antigen init $HOME/.antigenrc

[ -f "~/dotFiles/env.sh" ] && source "~/dotFiles/env.sh"

export TERM=xterm-256color

autoload -Uz compinit && compinit

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias git="LANGUAGE=en_US.UTF-8 \"git\""
alias vim="LANGUAGE=en_US.UTF-8 \"nvim\""
alias ls="LANGUAGE=en_US.UTF-8 \"ls\" --color"

unalias gm
# unalias ag

if [[ -x ~/.local/bin/thefuck ]]; then
    alias fuck='eval $(~/.local/bin/thefuck $(fc -ln -1 | tail -n 1)); fc -R'
fi

# fix tmux + zsh behaviour
export DISABLE_AUTO_TITLE=true

export LESSCHARSET=UTF-8

# composer
export COMPOSER_HOME=$HOME/.composer
export COMPOSER_DISABLE_XDEBUG_WARN=1

export PATH=$PATH:$HOME/bin:$COMPOSER_HOME:$HOME/.config/nvim/pack/packager/opt/phpactor/bin

# nvim is da tru editor
export EDITOR="/usr/bin/nvim"

# fzf
export FZF_DEFAULT_COMMAND='rg -u --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export XDG_CONFIG_DIRS="$XDG_CONFIG_DIRS:$HOME/.config/xdg"
