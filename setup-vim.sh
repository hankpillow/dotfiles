#!/bin/bash

# check for .vim at home and create if needed
if [ ! -d $HOME/.vim ]; then mkdir -v $HOME/.vim; fi

# # check .vim folders and create the missing ones
for folder in $(find vim/.vim/* -type d); do
  f=$(basename $folder)
  if [ -d "$HOME/.vim/$f" ]; then
    echo "- Folder $HOME/.vim/$f already exists"
  else
    ln -Fsv "$(pwd)/$folder" "$HOME/.vim/$f"
  fi
done

# # bkp current version if exists but it's not a link
if [ -e "$HOME/.vimrc" ]; then
  cp -v "$HOME/.vimrc" "$HOME/.vimrc.$(date +%s).bkp"
fi

# # link vimrc
cp -v ./vim/vimrc.vim $HOME/.vimrc

# first time here? get the vim-plug first
if [[ "$1" == "install" ]];
then
    echo "installing plugins"
    vim -c PlugInstall -c q
    vim -u NONE -c "helptags vim-fugitive/doc" -c q
fi

echo "done!"
