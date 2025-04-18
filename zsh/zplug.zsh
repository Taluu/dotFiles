if [[ ! -f "${ZPLUG_HOME:-$HOME/.zplug}/init.zsh" ]]; then
    echo 'nope'
    echo
    return
fi

source "${ZPLUG_HOME:-$HOME/.zplug}/init.zsh"

zplug zplug/zplug, hook-build:'zplug --self-manage'

#zplug zsh-users/zsh-completions
zplug zsh-users/zsh-syntax-highlighting, defer:2
zplug zsh-users/zsh-history-substring-search, defer:3

zplug joel-porquet/zsh-dircolors-solarized

zplug romkatv/powerlevel10k, as:theme, depth:1

if ! zplug check --verbose; then
    zplug install
fi

zplug load
