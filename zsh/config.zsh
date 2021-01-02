# Allow comments
set -k

# history
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE

[ -f ~/dotfiles/zsh/zplug.zsh ] && source ~/dotfiles/zsh/zplug.zsh

[ -f ~/dotFiles/env.sh ] && source ~/dotFiles/env.sh

export TERM=xterm-256color

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias git="LANGUAGE=en_US.UTF-8 \"git\""
alias vim="LANGUAGE=en_US.UTF-8 \"vim\""
alias ls="LANGUAGE=en_US.UTF-8 \"ls\" --color"

if [[ -x ~/.local/bin/thefuck ]]; then
    alias fuck='eval $(~/.local/bin/thefuck $(fc -ln -1 | tail -n 1)); fc -R'
fi

# fix tmux + zsh behaviour
export DISABLE_AUTO_TITLE=true

export LESSCHARSET=UTF-8

# composer
export COMPOSER_HOME=$HOME/.config/composer #xdg base
export COMPOSER_DISABLE_XDEBUG_WARN=1

export PATH=$PATH:$HOME/bin:$HOME/.config/nvim/pack/packager/opt/phpactor/bin:$HOME/.local/bin:$HOME/go/bin

# vim is da tru editor
export EDITOR="/usr/bin/vim"

# let's keep "emacs" mode for now... Consider migrating to vim mode, cuz it's da tru editor
bindkey -e
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# fzf
export FZF_DEFAULT_COMMAND='rg -u --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export XDG_CONFIG_DIRS="$XDG_CONFIG_DIRS:$HOME/.config/xdg"
