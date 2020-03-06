#!/bin/bash
# Grant .config/fish/functions before..
rm -rvf ~/.config/fish
mkdir -vp ~/.config/fish/functions
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

