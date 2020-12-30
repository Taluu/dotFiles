# Allow comments
set -k

# history
HISTSIZE=10000
SAVEHIST=$HISTSIZE

[ -f ~/dotfiles/zsh/zplug.zsh ] && source ~/dotfiles/zsh/zplug.zsh

[ -f ~/dotFiles/env.sh ] && source ~/dotFiles/env.sh

export TERM=xterm-256color

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias git="LANGUAGE=en_US.UTF-8 \"git\""
alias vim="LANGUAGE=en_US.UTF-8 \"nvim\""
alias ls="LANGUAGE=en_US.UTF-8 \"ls\" --color"

# fuck you git plugin, I don't want such aliases
unalias gm

if [[ -x ~/.local/bin/thefuck ]]; then
    alias fuck='eval $(~/.local/bin/thefuck $(fc -ln -1 | tail -n 1)); fc -R'
fi

# fix tmux + zsh behaviour
export DISABLE_AUTO_TITLE=true

export LESSCHARSET=UTF-8

# composer
export COMPOSER_HOME=$HOME/.config/composer #xdg base
export COMPOSER_DISABLE_XDEBUG_WARN=1

export PATH=$PATH:$HOME/bin:$HOME/.config/nvim/pack/packager/opt/phpactor/bin:$HOME/.local/bin

# nvim is da tru editor
export EDITOR="/usr/bin/nvim"
bindkey -v

# let's keep some old "emacs" binding for now, until I get used to vi ones
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey 'k' history-substring-search-up
bindkey 'j' history-substring-search-down

bindkey '^A' beginning-of-line
bindkey '^' beginning-of-line
bindkey '^E' end-of-line
bindkey '$' end-of-line

# fzf
export FZF_DEFAULT_COMMAND='rg -u --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export XDG_CONFIG_DIRS="$XDG_CONFIG_DIRS:$HOME/.config/xdg"
