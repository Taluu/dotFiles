#
# Alias for symfony's console
# which can be either app/console or bin/console in
# classic structures
#

function __get_sf_console_path
    set -l path (find . -maxdepth 2 -mindepth 1 -name 'console' -type f | head -n 1)

    if test -z $path
        return
    end

    echo $path
end

function sf
    set -l path (__get_sf_console_path)

    if test -z $path
        return
    end

    eval "php $path $argv"
end
