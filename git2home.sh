#!/bin/bash

cp -fv .gitconfig ~/
cp -fv .gitignore ~/
cp -fv .*rc ~/
cp -fv tsconfig.json ~/

rsync -rahv fish/ ~/.config/fish --exclude completions --exclude fish_variables
rsync -rav --delete nvim/** ~/.config/nvim  
