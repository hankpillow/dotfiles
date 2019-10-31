#!/bin/bash

echo install fish-shell addons for copy and paste
curl --silent "https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/functions/fish_clipboard_copy.fish"  > ~/.config/fish/functions/fish_clipboard_copy.fish
curl --silent "https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/functions/fish_clipboard_paste.fish"  > ~/.config/fish/functions/fish_clipboard_paste.fish

if [[ ! $(command -v fisher) ]]; then
    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fi

fisher add fishpkg/fish-git-util
fisher add jethrokuan/fzf
#
# Send local
find ~/.config/* -type f -iname "*.fish" | grep -v fisher  | xargs rm
cp -v config/fish/functions/*.fish ~/.config/fish/functions/
cp -v config/fish/config.fish ~/.config/fish/

# Grant proper permissions
chmod +x ~/.config/fish/functions/*.fish
