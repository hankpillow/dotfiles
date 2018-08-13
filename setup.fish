#!/bin/bash

mkdir -p ~/.config/fish/functions
rm -f ~/.config/fish/functions/*.fish
cp -v config/fish/functions/*.fish ~/.config/fish/functions/
cp -v config/fish/config.fish ~/.config/fish/

if [[ ! -f ~/.config/fish/functions/fisher.fish ]]; then
  curl --silent -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
  chmod 755 ~/.config/fish/functions/fisher.fish
	echo -e "Run:\nfisher ls | fish rm; and fisher git_util"
fi


