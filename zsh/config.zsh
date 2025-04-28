# Allow comments
set -k

# P10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f "$HOME/.custom.zsh" ]]; then
    source "$HOME/.custom.zsh"
fi

export DOTFILES_PATH=${DOTFILES_PATH:-$HOME/dotfiles}

if (( ${+commands[direnv]} )); then
    emulate zsh -c "$(direnv export zsh)"
fi

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

if [[ -f "$DOTFILES_PATH/zsh/zplug.zsh" ]]; then
    source "$DOTFILES_PATH/zsh/zplug.zsh"
fi

export TERM=xterm-256color

alias git="LANGUAGE=en_US.UTF-8 \"git\""
alias vim="LANGUAGE=en_US.UTF-8 \"nvim\""
alias ls="LANGUAGE=en_US.UTF-8 \"ls\" --color"
alias ll="LANGUAGE=en_US.UTF-8 \"ls\" --color -al"

# fix tmux + zsh behaviour
export DISABLE_AUTO_TITLE=true

export LESSCHARSET=UTF-8

# composer
export COMPOSER_HOME=$HOME/.config/composer #xdg base
export COMPOSER_DISABLE_XDEBUG_WARN=1

# path handling
path+=(
    $HOME/bin
    $HOME/.local/bin
    $HOME/.config/composer/vendor/bin
    $HOME/go/bin
    /usr/local/go/bin
    $HOME/.cargo/bin
)

for p in $extra_paths; do
    path+=($p)
done

typeset -U path

# nvim is da tru editor
export EDITOR="${TRU_EDITOR:-/usr/local/bin/nvim}"

# let's keep "emacs" mode for now... Consider migrating to vim mode, cuz it's da tru editor
bindkey -e
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down

# ripgrep
if (( ${+commands[rg]} )); then
    export FZF_DEFAULT_COMMAND='rg --files --follow'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

    source "$DOTFILES_PATH/zsh/rg.zsh"
fi

export XDG_CONFIG_DIRS="$XDG_CONFIG_DIRS:$HOME/.config/xdg"

fpath+=($HOME/.zsh_completions)
typeset -U fpath

zstyle ':completion:*' menu select

if (( ${+commands[thefuck]} )); then
    eval $(thefuck --alias)
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ -f "$DOTFILES_PATH/zsh/powerline10k.zsh" ]]; then
    source "$DOTFILES_PATH/zsh/powerline10k.zsh"
fi
