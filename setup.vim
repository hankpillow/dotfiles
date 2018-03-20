#!/bin/bash
# vim: ft=sh

[[ -f ~/.vimrc ]] && cp -v "$HOME.vimrc" "$HOME.vimrc.$(date +%s).bkp"
cat vim/{preinstall,helpers,plugin,theme,settings,augroup}.vim > $HOME/.vimrc

yes="^y|Y$"
read -e -p "install plugins? [y/N]" install
if [[ "$install" =~ $yes ]]; then
  vim +PlugUpdate +qall
  vim +PlugUpgrade +qall
fi
