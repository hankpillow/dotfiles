#!/bin/bash

mkdir -p ~/.config/fish/functions
# find ~/.config/fish/functions/*.fish | grep -v "fisher" | xargs rm -fv
cp -v config/fish/functions/*.fish ~/.config/fish/functions/
cp -v config/fish/config.fish ~/.config/fish/
curl --silent "https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/functions/fish_clipboard_copy.fish"  > ~/.config/fish/functions/fish_clipboard_copy.fish
curl --silent "https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/functions/fish_clipboard_paste.fish"  > ~/.config/fish/functions/fish_clipboard_paste.fish
chmod +x ~/.config/fish/functions/*.fish

if [[ ! -f "$HOME/.config/fish/functions/fisher.fish" ]]; then
  curl --silent -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
  chmod 755 ~/.config/fish/functions/fisher.fish
	echo -e "Run:\nfisher ls | fisher rm; and fisher git_util"
fi


