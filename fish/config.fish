# xterm 256 colors
set TERM xterm-256color

set VIMRUNTIME $HOME/.vim

# less, utf8 !
set LESSCHARSET UTF-8

if not contains "$HOME/bin" $PATH
    set PATH "$HOME/bin" $PATH
end

# rbenv stuff
if test -d $HOME/.rbenv
    if not contains "$HOME/.rbenv/bin" $PATH
        set PATH "$HOME/.rbenv/bin" $PATH
    end

    if type -q rbenv
        rbenv init - fish > /dev/null
    end
end

# pip mess
if not contains "$HOME/.local/bin" $PATH
    set PATH "$HOME/.local/bin" $PATH
end

# nvim is da tru editor
set EDITOR "/usr/bin/nvim"

# fzf
set FZF_DEFAULT_COMMAND 'ag -l -g "" ./ vendor/'
set FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

# xdg stuff
set XDG_CONFIG_DIRS "$XDG_CONFIG_DIRS:$HOME/.config/xdg"

# composer stuff
set COMPOSER_HOME $HOME/.composer
set COMPOSER_DISABLE_XDEBUG_WARN 1

# fisherman stuff
set fish_path ~/dotFiles/fish

# don't shorten the prompt, I need the full prompt, I like the full prompt...
# set fish_prompt_pwd_dir_length 1

# me want agnoster + powerline, thank you very much
agnoster powerline
