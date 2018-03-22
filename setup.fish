#!/bin/bash

if [[ ! -d ~/.config/fish/functions ]]; then
  mkdir -p ~/.config/fish/functions
fi

if [[ -f ~/.config/fish/config.fish ]]; then
  cp -v ~/.config/fish/config.fish "$HOME/.config/fish/config.fish.$(date +%s).bkp"
fi

if [[ ! -f ~/.config/fish/functions/fisher.fish ]]; then
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
  fisher fzf git_util
fi

cp -v config/fish/fish_prompt.fish ~/.config/fish/functions/
cp -v config/fish/config.fish ~/.config/fish/
source ~/.config/fish/config.fish
