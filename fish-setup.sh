#!/bin/bash
# Grant .config/fish/functions before..
rm -rvf ~/.config/fish
mkdir -vp ~/.config/fish/functions

source fish-update-config.sh

if [[ ! $(command -v fish) ]]; then
  echo "Install fish first"
  sudo add-apt-repository ppa:fish-shell/release-3
  sudo apt-get install fish --fix-missing
fi

if [[ ! $(command -v fisher) ]]; then
    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fi

fisher

