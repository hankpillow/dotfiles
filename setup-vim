#!/bin/bash
# vim: ft=sh

cat vim/{preinstall,helpers,plugin,theme,settings,augroup}.vim > ~/.vimrc
echo "~/.vimrc updated"

yes="^y|Y$"
read -e -p "install plugins? [y/N]" install
if [[ "$install" =~ $yes ]]; then
  vim +PlugUpdate +qall
  vim +PlugUpgrade +qall
fi
