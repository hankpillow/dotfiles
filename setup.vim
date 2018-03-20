#!/bin/bash

cat vim/vim-{preinstall,plugin,helpers,settings,theme}.vim > $HOME/.vimrc
echo "+ .vimrc updated"

if [[ "$1" == "install" ]]; then
  echo "# VIM FULL INSTALL"
  vim +PlugUpdate +qall
  vim +PlugUpgrade +qall
fi

