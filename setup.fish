#!/bin/bash

mkdir -vp ~/.config/fish/functions
# find ~/.config/fish/functions/*.fish | grep -v "fisher" | xargs rm -fv
cp -v config/fish/functions/*.fish ~/.config/fish/functions/
cp -v config/fish/config.fish ~/.config/fish/
curl --silent "https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/functions/fish_clipboard_copy.fish"  > ~/.config/fish/functions/fish_clipboard_copy.fish
curl --silent "https://raw.githubusercontent.com/fish-shell/fish-shell/master/share/functions/fish_clipboard_paste.fish"  > ~/.config/fish/functions/fish_clipboard_paste.fish
chmod +x ~/.config/fish/functions/*.fish

if [[ ! -f "$HOME/.config/fish/functions/fisher.fish" ]]; then
  curl --silent -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
  chmod 755 ~/.config/fish/functions/fisher.fish
  fisher add fishpkg/fish-git-util
fi

chmod 700 ~/.ssh
chmod 644 ~/.ssh/*.pub
ls ~/.ssh/* | grep -v pub | xargs chmod 600

# The .ssh folder: 700 (drwx------)
# The public key: 644 (-rw-r--r--)
# The private key: 600 (-rw-------)


