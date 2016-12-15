if [[ -e $HOME/.bash_profile ]];
then
  cp -v $HOME/.bash_profile "$HOME/.bash_profile.bkp-$(date +%s)"
fi

cat terminal/autocomplete/* terminal/*.sh > $HOME/.bash_profile
bash $HOME/.bash_profile
echo 'terminal updated.'

cat terminal/.gitconfig > $HOME/.gitconfig
echo '.gitconfig updated'
