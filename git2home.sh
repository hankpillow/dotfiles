#!/bin/bash

echo sync configs
cp -f .gitconfig ~/
cp -f .gitignore ~/
cp -f .bashrc ~/

echo sync fish
rsync -rah fish/ ~/.config/fish --exclude completions --exclude fish_variables

echo sync nvim
rsync -rav --delete nvim/** ~/.config/nvim  
