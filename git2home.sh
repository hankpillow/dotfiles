#!/bin/bash

cp -f .*rc ~/

rsync -ravh tmux/ ~/ 
#rsync -ravh git/ ~/ 

rsync -ravh fish/ ~/.config/fish --exclude completions --exclude fish_variables
rsync -ravh --delete nvim/** ~/.config/nvim  
