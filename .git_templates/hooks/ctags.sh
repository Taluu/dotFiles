#!/bin/sh
set -e
PATH="/usr/local/bin:$PATH"
dir="`git rev-parse --git-dir`"
trap 'rm -f "$dir/$$.tags"' EXIT
git ls-files | \
    ctags -R --php-kinds=cdfint --exclude=*Test.php src/**/*.php vendor/**/*.php
mv "$dir/$$.tags" "$dir/tags"
