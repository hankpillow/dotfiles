#!/bin/bash

if [[ ! -d .cache ]]
then
    mkdir -vp .cache
fi

cd .cache

VERSION="0.8.3"
FILE="nvim-linux64.deb"
if [[ ! -f .cache/$FILE ]]
then
    echo "+ download $FILE"
    wget "https://github.com/neovim/neovim/releases/download/v${VERSION}/$FILE"
fi
sudo dpkg -i $FILE
