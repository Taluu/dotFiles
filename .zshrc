# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="agnoster"

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# history
HISTSIZE=10000
SAVEHIST=$HISTSIZE

# dafuq ?!
setopt no_cdable_vars

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git composer symfony2 debian npm node history-substring-search colored-man gem zsh_reload tmux zsh-completions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# composer
export COMPOSER_HOME=$HOME/.composer

export PATH=$PATH:/home/talus/bin
export PATH=$PATH:$COMPOSER_HOME

export NODE_PATH=/usr/local/lib/node_modules

# Allow comments
set -k

# xterm 256 colors
TERM=xterm-256color
#if [ "$TERM" = "xterm" ] ; then
#    if [ -z "$COLORTERM" ] ; then
#        if [ -z "$XTERM_VERSION" ] ; then
#            echo "Warning: Terminal wrongly calling itself 'xterm'."
#        else
#            case "$XTERM_VERSION" in
#                "XTerm(256)") TERM="xterm-256color"                                      ;;
#                "XTerm(88)" ) TERM="xterm-88color"                                       ;;
#                "XTerm"     )                                                            ;;
#                           *) echo "Warning: Unrecognized XTERM_VERSION: $XTERM_VERSION" ;;
#            esac
#        fi
#    else
#        case "$COLORTERM" in
#            gnome-terminal)
#                # Those crafty Gnome folks require you to check COLORTERM,
#                # but don't allow you to just *favor the setting over TERM.
#                # Instead you need to compare it and perform some guesses
#                # based upon the value. This is, perhaps, too simplistic.
#                TERM="gnome-256color"
#                ;;

#            *) echo "Warning: Unrecognized COLORTERM: $COLORTERM";;
#        esac
#    fi
#fi

VIMRUNTIME=$HOME/.vim

# added by travis gem
# source /home/talus/.travis/travis.sh

# less, utf8 !
LESSCHARSET=UTF-8

alias git="LANGUAGE=en_US.UTF-8 \"git\""
alias vim="LANGUAGE=en_US.UTF-8 \"vim\""
alias ls="LANGUAGE=en_US.UTF-8 \"ls\""

unalias gm
unalias ag

# fix tmux + zsh behaviour
DISABLE_AUTO_TITLE=true

# display a motd
if [[ ! -a /tmp/motd ]]; then
    sh /etc/update-motd.d/00-header
    echo
    
    if [[ -x /usr/games/fortune ]]; then
        /usr/games/fortune # | cowsay -n
        echo
    fi

    touch /tmp/motd
fi

# rbenv stuff
export PATH="$PATH:$HOME/.rbenv/bin" # Add Rbenv to PATH for scripting
eval "$(rbenv init -)"

# zsh completion
autoload -U compinit && compinit
