if [ ! -f ~/.zplug/init.zsh ]; then
    echo 'nope'
    echo
    return
fi

source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/dnf", from:oh-my-zsh
zplug "plugins/fzf", from:oh-my-zsh
zplug "plugins/direnv", from:oh-my-zsh

zplug "plugins/asdf", from:oh-my-zsh
zplug "plugins/composer", from:oh-my-zsh
zplug "plugins/golang", from:oh-my-zsh

zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh

zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh

zplug "zsh-users/zsh-completions"
zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "plugins/zsh-navigation-tools", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

zplug "joel-porquet/zsh-dircolors-solarized"

zplug "exercism/cli", use:"shell/*.zsh"

zplug "containers/libpod", use:"completions/zsh/*"

zplug "agnoster/agnoster-zsh-theme", as:theme

if ! zplug check --verbose; then
    zplug install
fi

zplug load
