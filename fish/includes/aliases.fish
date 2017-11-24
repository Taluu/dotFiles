#
# My aliases
#
# They're usually just launching the command in english
# rather than whatever locale is used.
#

function git
    command git $argv
end

function vim
    set LANG "en_us.UTF-8"
    command nvim $argv
end

functions --copy ls _ls
function ls
    set LANG "en_us.UTF-8"
    _ls $argv
end

function csu
    command composer self-update
end
