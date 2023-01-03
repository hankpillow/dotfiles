#!/bin/bash

cp -vf .gitconfig ~/
cp -vf .gitignore ~/
cp -vf .bashrc ~/
rsync -rahv fish/ ~/.config/fish --exclude completions --exclude fish_variables
rsync -rahv --delete nvim/*.lua ~/.config/nvim  --exclude plugin 
rsync -rahv --delete nvim/lua/*.lua ~/.config/nvim/lua  --exclude plugin
rsync -rahv --delete nvim/lua/after/*.lua ~/.config/nvim/lua/after  --exclude plugin
