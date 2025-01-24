# Allow comments
set -k

# P10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -f ~/.custom.zsh ] && source ~/.custom.zsh

(( ${+commands[direnv]} )) && emulate zsh -c "$(direnv export zsh)"

# history
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE

setopt EXTENDED_HISTORY
setopt HIST_VERIFY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY

[ -f ~/dotfiles/zsh/zplug.zsh ] && source ~/dotfiles/zsh/zplug.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/dotfiles/zsh/powerline10k.zsh ]] || source ~/dotfiles/zsh/powerline10k.zsh

export TERM=xterm-256color

alias git="LANGUAGE=en_US.UTF-8 \"git\""
alias vim="LANGUAGE=en_US.UTF-8 \"nvim\""
alias ls="LANGUAGE=en_US.UTF-8 \"ls\" --color"
alias ll="LANGUAGE=en_US.UTF-8 \"ls\" --color -al"

if [[ -x ~/.local/bin/thefuck ]]; then
    alias fuck='eval $(~/.local/bin/thefuck $(fc -ln -1 | tail -n 1)); fc -R'
fi

# fix tmux + zsh behaviour
export DISABLE_AUTO_TITLE=true

export LESSCHARSET=UTF-8

# composer
export COMPOSER_HOME=$HOME/.config/composer #xdg base
export COMPOSER_DISABLE_XDEBUG_WARN=1

# path handling
path+=(
    $HOME/bin
    $HOME/.local/share/nvim/site/pack/packer/opt/phpactor/bin
    $HOME/.local/bin
    $HOME/go/bin
    /usr/local/go/bin
    $HOME/.cargo/bin
)

for p in $extra_paths; do
    path+=($p)
done

typeset -U path

# nvim is da tru editor
export EDITOR="${TRU_EDITOR:-/usr/loca/bin/nvim}"

# let's keep "emacs" mode for now... Consider migrating to vim mode, cuz it's da tru editor
bindkey -e
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down

# fzf
export FZF_DEFAULT_COMMAND='rg --files --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export XDG_CONFIG_DIRS="$XDG_CONFIG_DIRS:$HOME/.config/xdg"

fpath+=($HOME/.zsh_completions)
typeset -U fpath

zstyle ':completion:*' menu select

# kubectl (for some reasons, it errors when placed into the zsh completion dir)
if [[ -x /usr/local/bin/kubectl ]]; then
    source <(kubectl completion zsh)
fi

# ngrok autocomplete
if command -v ngrok &>/dev/null; then
    eval "$(ngrok completion)"
fi
