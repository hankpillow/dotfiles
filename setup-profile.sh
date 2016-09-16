files=( "ps1.sh" "helpers.sh" "export.sh" "git-completion.bash" "git-prompt.bash" "docker-machine-prompt.bash" "docker-machine.bash" )
bundle=""
for file in "${files[@]}"
do
  bundle="https://raw.githubusercontent.com/hankpillow/dotfiles/master/$file $bundle"
done
if [[ -e $HOME/.bash_profile ]];
then
  cp -v $HOME/.bash_profile "$HOME/.bash_profile.bkp-$(date +%s)"
fi
curl -O $bundle > $HOME/.bash_profile
cat $HOME/.bash_profile
bash $HOME/.bash_profile
