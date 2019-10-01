#!/bin/bash
# Grant .config/fish/functions before..
rm -rvf ~/.config/fish
mkdir -vp ~/.config/fish/functions

if [[ ! $(command -v fisher) ]]; then
    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fi

echo install fish-shell addons for copy and paste
curl --silent "https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/functions/fish_clipboard_copy.fish"  > ~/.config/fish/functions/fish_clipboard_copy.fish
curl --silent "https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/functions/fish_clipboard_paste.fish"  > ~/.config/fish/functions/fish_clipboard_paste.fish

source fish-update-config.sh

if [[ ! $(command -v fish) ]]; then
  sudo add-apt-repository ppa:fish-shell/release-3
  sudo apt-get install fish --fix-missing
fi

fish
fisher add fishpkg/fish-git-util
fisher add jethrokuan/fzf

