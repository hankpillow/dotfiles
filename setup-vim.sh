if [[ -e $HOME/.vimrc ]];
then
  cp -v $HOME/.vimrc "$HOME/.vimrc.bkp-$(date +%s)"
fi
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -H "Cache-Control: no-cache" "https://raw.githubusercontent.com/hankpillow/dotfiles/master/vimrc" > $HOME/.vimrc
vim -u NONE -c "helptags vim-fugitive/doc" -c q
vim +PlugInstall
