#!/bin/bash

if [ ! -d $HOME/.vim ]; then mkdir -v $HOME/.vim; fi

for folder in $(find vim/.vim/* -type d); do
  f=$(basename $folder)
  if [ -d "$HOME/.vim/$f" ]; then
    echo "- Folder $HOME.vim/$f already exists"
  else
    echo ln -Fsv "$(pwd)/$folder" "$HOME.vim/$f"
  fi
done

if [ -e "$HOME.vimrc" ]; then
  echo "Backup current .vimrc"
  cp -v "$HOME.vimrc" "$HOME.vimrc.$(date +%s).bkp"
  cat ./vim/vimrc.vim > $HOME.vimrc
fi

echo done

# echo copia vimrc

#first time here? get the vim-plug first
if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
  echo instala tudo
  # curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  # vim +PlugInstall
  # vim -u NONE -c "helptags vim-fugitive/doc" -c q
fi
