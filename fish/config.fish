set LESSCHARSET UTF-8 # use utf-8 with less
set TERM xterm-256color
set EDITOR "/usr/bin/nvim" # nvim is da tru editor
set XDG_CONFIG_DIRS "$XDG_CONFIG_DIRS:$HOME/.config/xdg"

if not contains "$HOME/bin" $PATH; and test -d "$HOME/bin";
    set PATH "$HOME/bin" $PATH
end

if test -e "$HOME/.asdf/asdf.fish"
    source "$HOME/.asdf/asdf.fish"

    if not test -e "$HOME/.config/fish/completions/asdf.fish"
        ln -s "$HOME/.asdf/completions/asdf.fish" "$HOME/.config/fish/completions/asdf.fish"
    end
end

if command -sq direnv
    direnv hook fish | source
end

if not contains "$HOME/.local/bin" $PATH; and test -d "$HOME/.local/bin"
    set PATH "$HOME/.local/bin" $PATH
end

if not contains (yarn global bin) $PATH
    set PATH (yarn global bin) $PATH
end

if not contains "$HOME/.cargo/bin" $PATH
    set PATH "$HOME/.cargo/bin" $PATH
end

if not contains "$HOME/.config/nvim/plugged/phpactor/bin/" $PATH; and test -d "$HOME/.config/nvim/plugged/phpactor/bin/"
    set PATH "$HOME/.config/nvim/plugged/phpactor/bin/" $PATH
end

if not contains "$HOME/.fzf/bin/" $PATH; and test -d "$HOME/.fzf/bin/"
    set PATH "$HOME/.fzf/bin/" $PATH
end

set RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src

# fzf
set FZF_DEFAULT_COMMAND 'rg -l -g "" ./ vendor/'
set FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

# composer stuff
set COMPOSER_HOME $HOME/.composer
set COMPOSER_DISABLE_XDEBUG_WARN 1

# don't shorten the prompt, I need the full prompt, I like the full prompt...
# set fish_prompt_pwd_dir_length 1

set fish_greeting # no greeting message please. kthxby

if [ -f "$HOME/google-cloud-sdk/path.fish.inc" ]; 
    source "$HOME/google-cloud-sdk/path.fish.inc"; 
end

if command -sq thefuck
    thefuck --alias > /dev/null
end
