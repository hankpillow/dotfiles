#!/bin/bash

if [[ ! -d ~/.config/fish/functions ]]; then
  mkdir -p ~/.config/fish/functions
fi

for file in $(ls config/fish/functions/*.fish);
do
	cp -v $file ~/.config/fish/functions/
done

cp -v config/fish/config.fish ~/.config/fish/

if [[ ! -f ~/.config/fish/functions/fisher.fish ]]; then
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
  chmod 755 ~/.config/fish/functions/fisher.fish
fi

#------ fzf plugins
yes="^y|Y$"
read -e -p "install fzf and git_util (required for prompt)? [y/N]" value
[[ "$value" =~ $yes ]] && fish ~/.config/fish/functions/fisher.fish fzf git_util
unset value



