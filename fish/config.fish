if test -d ~/dotFiles/fish/includes
    for file in ~/dotFiles/fish/includes/*.fish
        source $file
    end
end

function src
    exec fish
end
