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
if [ -e "$HOME/.vimrc" ] && [ ! -h "$HOME/.vimrc" ]; then
  cp -v "$HOME/.vimrc" "$HOME/.vimrc.$(date +%s).bkp"
fi

# link vimrc
if [ ! -h "$HOME/.vimrc" ]; then
  echo ln -Fsv ./vim/vimrc.vim "$HOME/.vimrc"
else
  echo "- The file $HOME/.vimrc is already a symbolic link"
fi

# first time here? get the vim-plug first
if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
  echo "downloading vim-plug..."
  curl -fLo $HOME/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "installing plugins"
  vim -c PlugInstall -c q
  vim -u NONE -c "helptags vim-fugitive/doc" -c q
fi

echo "done!"
