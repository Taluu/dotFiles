# Allow comments
set -k

# P10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
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

export PATH=$PATH:$HOME/bin:$HOME/.local/share/nvim/site/pack/packer/opt/phpactor/bin:$HOME/.local/bin:$HOME/go/bin:/usr/local/go/bin

# vim is da tru editor
export EDITOR="/usr/bin/vim"

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

export FPATH=$HOME/.zsh_completions:$FPATH

zstyle ':completion:*' menu select

# direnv
if [[ -x /usr/bin/direnv ]]; then
    eval "$(/usr/bin/direnv hook zsh)"
fi

[ -f ~/.zsh_custom.sh ] && source ~/.zsh_custom.sh
