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

# Send local
cp -v config/fish/functions/*.fish ~/.config/fish/functions/
cp -v config/fish/config.fish ~/.config/fish/

# Grant proper permissions
chmod +x ~/.config/fish/functions/*.fish

if [[ ! $(command -v fish) ]]; then
  echo "# Install with sudo fish"
  echo "sudo add-apt-repository ppa:fish-shell/release-3"
  echo "sudo apt-get install fish --fix-missing"
  exit 1
else
  echo type 'fish' and enjoy
fi


