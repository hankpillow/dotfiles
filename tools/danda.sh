#!/bin/bash
# https://github.com/dandavison/delta
if [[ ! -d .cache ]]
then
    mkdir -vp .cache
fi

cd .cache

VERSION="0.16.5"
FILE="git-delta_${VERSION}_amd64.deb"
echo $FILE

if [[ ! -f $FILE ]]
then
    echo "+ download $FILE"
    wget "https://github.com/dandavison/delta/releases/download/$VERSION/$FILE"
fi
if [[ ! -f $FILE ]]; then
    echo Failed to donwload
    exit 1
fi
sudo dpkg -i $FILE
echo  "
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true    # use n and N to move between diff sections
    light = false      # set to true if you're in a terminal w/ a light background color (e.g. the default macOS terminal)

[merge]
    conflictstyle = diff3

[diff]
    colorMoved = default
"
