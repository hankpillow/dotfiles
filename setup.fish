#!/bin/bash

if [[ -f ~/.config/fish/config.fish ]]; then
  cp -v ~/.config/fish/config.fish "$HOME/.config/fish/config.fish.$(date +%s).bkp"
fi
cp -v config.fish ~/.config/fish/config.fish
source ~/.config/fish/config.fish
