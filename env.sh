#
# My env variables
# 

# fix tmux + zsh behaviour
export DISABLE_AUTO_TITLE=true

export VIMRUNTIME=$HOME/.vim

# less, utf8 !
export LESSCHARSET=UTF-8

# composer
export COMPOSER_HOME=$HOME/.composer
export COMPOSER_DISABLE_XDEBUG_WARN=1

export PATH=$PATH:$HOME/bin
export PATH=$PATH:$COMPOSER_HOME

export NODE_PATH=/usr/local/lib/node_modules

# rbenv stuff
export PATH="$PATH:$HOME/.rbenv/bin" # Add Rbenv to PATH for scripting
[ -s "rbenv" ] && eval "$(rbenv init - zsh)"

# pip mess
export PATH="$PATH:$HOME/.local/bin"

# vim is da tru editor
export EDITOR="/usr/bin/nvim"

# nvm sheeeeeeeit
export NVM_DIR="/home/talus/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# fzf
export FZF_DEFAULT_COMMAND='ag -l -g "" ./ vendor/'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# xdg stuff
export XDG_CONFIG_DIRS="$XDG_CONFIG_DIRS:$HOME/.config/xdg"
