#!/bin/sh

REPO="git://github.com/Taluu/pareto-end"
TMP_REPO="/tmp/pareto"
BUILD_PATH="$HOME/web/pareto"

git clone $REPO $TMP_REPO
jekyll build -s $TMP_REPO -d $BUILD_PATH
rm -rf $TMP_REPO
exit 0
