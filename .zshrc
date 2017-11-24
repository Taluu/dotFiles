# Allow comments
set -k

# OMZ CONFIG
ZSH_THEME="agnoster"
ZSH=$HOME/.oh-my-zsh

# history
HISTSIZE=10000
SAVEHIST=$HISTSIZE

# dafuq ?!
setopt no_cdable_vars

plugins=(git composer symfony2 archlinux npm node history-substring-search colored-man gem zsh_reload tmux zsh-completions jsontools znt-navigation-tools rails zsh-syntax-highlighting docker docker-compose)

source $ZSH/oh-my-zsh.sh

# xterm 256 colors
TERM=xterm-256color

# display a motd
if [[ ! -a /tmp/motd ]]; then
    if [[ -x /usr/games/fortune ]]; then
        /usr/games/fortune # | cowsay -n
        echo
    fi

    touch /tmp/motd
fi

# zsh completion
autoload -U compinit && compinit

# fucking git, don't want the completion of remote branches !!
zstyle :completion::complete:git-checkout:argument-rest:headrefs command "git for-each-ref --format='%(refname)' refs/heads 2>/dev/null"

[ -f "~/dotFiles/env.sh" ] && source "~/dotFiles/env.sh"
[ -f "~/dotFiles/aliases.sh" ] && source "~/dotFiles/aliases.sh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
