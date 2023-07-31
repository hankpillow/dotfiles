#!/bin/bash

if [[ ! -d .cache ]]
then
    mkdir -vp .cache
fi

cd .cache
rm -f nvim.appimage
curl -LO https://github.com/neovim/neovim/releases/download/v0.9.1/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/bin/nvim
