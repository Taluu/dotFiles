# xterm 256 colors
set TERM xterm-256color

set VIMRUNTIME $HOME/.vim

# less, utf8 !
set LESSCHARSET UTF-8

if not contains "$HOME/bin" $PATH; and test -d "$HOME/bin";
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
if not contains "$HOME/.local/bin" $PATH; and test -d "$HOME/.local/bin"
    set PATH "$HOME/.local/bin" $PATH
end

# yarn things
if not contains (yarn global bin) $PATH
    set PATH (yarn global bin) $PATH
end

# rust / cargo
if not contains "$HOME/.cargo/bin" $PATH
    set PATH "$HOME/.cargo/bin" $PATH
end

# phpactor
if not contains "$HOME/.config/nvim/plugged/phpactor/bin/" $PATH; and test -d "$HOME/.config/nvim/plugged/phpactor/bin/"
    set PATH "$HOME/.config/nvim/plugged/phpactor/bin/" $PATH
end

# fzf
if not contains "$HOME/.fzf/bin/" $PATH; and test -d "$HOME/.fzf/bin/"
    set PATH "$HOME/.fzf/bin/" $PATH
end

# nvim is da tru editor
set EDITOR "/usr/bin/nvim"

# fzf
set FZF_DEFAULT_COMMAND 'rg -l -g "" ./ vendor/'
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

# no greeting message please. kthxby
set fish_greeting

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.fish.inc" ]; 
    source "$HOME/google-cloud-sdk/path.fish.inc"; 
end
