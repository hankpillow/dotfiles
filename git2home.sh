#!/bin/bash

echo sync configs
cp -fv .gitconfig ~/
cp -fv .gitignore ~/
cp -fv .bashrc ~/
cp -fv .stylintrc.js ~/
cp -fv .prettierrc.js ~/
cp -fv .eslintrc.js ~/

echo sync fish
rsync -rah fish/ ~/.config/fish --exclude completions --exclude fish_variables

echo sync nvim
rsync -rav --delete nvim/** ~/.config/nvim  
