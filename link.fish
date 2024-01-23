#!/bin/bash

if [ -f ~/.config/fish/config.fish ] || [ -L ~/.config/fish/config.fish ]; then
    echo "~/.config/fish/config.fish already exist!" 
    exit 1
fi

mkdir -p ~/.config/fish
ln -vs $PWD/fish/config.fish ~/.config/fish/config.fish
