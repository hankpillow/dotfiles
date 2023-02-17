#!/bin/bash

cp -fv .*rc ~/
cp -fv git/* ~/
cp -fv tmux/* ~/

rsync -rahv fish/ ~/.config/fish --exclude completions --exclude fish_variables
rsync -rav --delete nvim/** ~/.config/nvim  
