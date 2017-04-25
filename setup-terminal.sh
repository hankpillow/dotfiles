if [[ -e $HOME/.gitconfig ]];
then
  cp -v "$HOME/.gitconfig" "$HOME/.gitconfig.$(date +%s).bkp"
fi
cat terminal/.gitconfig > $HOME/.gitconfig
echo '.gitconfig updated'

if [[ -e $HOME/.tmux.conf ]];
then
  cp -v "$HOME/.tmux.conf" "$HOME/.tmux.conf.$(date +%s).bkp"
fi
cat terminal/.tmux.conf > $HOME/.tmux.conf
echo '.tmux.conf updated'

if [[ -e $HOME/.bash_profile ]];
then
  cp -v "$HOME/.bash_profile" "$HOME/.bash_profile.$(date +%s).bkp"
fi

cat terminal/autocomplete/* terminal/*.sh > $HOME/.bash_profile
if [[ -e $HOME/.bashrc ]];
then
  bash $HOME/.bashrc
else
  bash $HOME/.bash_profile
fi
echo 'terminal updated.'
