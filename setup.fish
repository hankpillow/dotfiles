#!/bin/bash

# fisher
if [[ ! -f ~/.config/fish/functions/fisher.fish ]]; then
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
  chmod 755 ~/.config/fish/functions/fisher.fish
fi

fish ~/.config/fish/functions/fisher.fish fzf git_util

if [[ ! -d ~/.config/fish/functions ]]; then
  mkdir -p ~/.config/fish/functions
fi

if [[ -f ~/.config/fish/config.fish ]]; then
  cp -v ~/.config/fish/config.fish "$HOME/.config/fish/config.fish.$(date +%s).bkp"
fi

cp -v config/fish/config.fish ~/.config/fish/
cp -v config/fish/fish_prompt.fish ~/.config/fish/functions/


