#!/bin/bash

if [ ! -d $HOME/.vim ];
then
  echo "Creating .vim dir at home"
  mkdir $HOME/.vim -v
fi

for folder in $(find vim/.vim/* -type d); do
  f=$(basename $folder)
  if [ -d "$HOME/.vim/$f" ]; then
    echo "- Folder $HOME.vim/$f already exists"
  else
    # echo "+ Create link for $(pwd)/$folder"
    echo ln -s "$(pwd)/$folder" "$HOME.vim/$f" -v
  fi
done
# if [ ! -e $HOME/.vim/ftdetect ]; then mkdir -p $HOME/.vim/ftdetect -v; fi
# if [ ! -e $HOME/.vim/ftplugin ]; then mkdir -p $HOME/.vim/ftplugin -v; fi
# if [ ! -e $HOME/.vim/plugin ];   then mkdir -p $HOME/.vim/plugin -v; fi
# if [ ! -e $HOME/.vim/autoload ]; then mkdir -p $HOME/.vim/autoload -v; fi

if [ ! -e $HOME/.vim/autoload/plug.vim ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo done

# if [[ -e $HOME/.vimrc ]];
# then
#   cp -v; $HOME/.vimrc "$HOME/.vimrc.bkp-$(date +%s)"
# fi
# curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# curl -H "Cache-Control: no-cache" "https://raw.githubusercontent.com/hankpillow/dotfiles/master/vimrc" > $HOME/.vimrc
# vim -u NONE -c "helptags vim-fugitive/doc" -c q
# vim +PlugInstall
