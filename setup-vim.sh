if [[ ! -d $HOME/.vim/bundle ]];
then
	mkdir -p $HOME/.vim/bundle
	git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi
if [[ -e $HOME/.vimrc ]];
then
  cp -v $HOME/.vimrc "$HOME/.vimrc.bkp-$(date +%s)"
fi
curl "https://raw.githubusercontent.com/hankpillow/dotfiles/master/vimrc" > $HOME/.vimrc
vim +PluginInstall
