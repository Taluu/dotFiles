if [ ! -f ~/.zplug/init.zsh ]; then
    echo 'nope'
    echo
    return
fi

source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

zplug "joel-porquet/zsh-dircolors-solarized"

zplug "agnoster/agnoster-zsh-theme", as:theme

if ! zplug check --verbose; then
    zplug install
fi

zplug load
