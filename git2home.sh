#!/bin/bash
echo "...gitconfig"
cp -vf .gitconfig ~/

echo "...bashrc"
cp -vf .bashrc ~/

echo "...fish"
rsync -rahv fish/ ~/.config/fish --exclude completions --exclude fish_variables

echo "...nvim"
rsync -rahv nvim/ ~/.config/nvim  --exclude plugin