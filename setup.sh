files=( "ps1.sh" "alias.sh" "helpers.sh" "export.sh" "git-completion.bash" "git-prompt.bash" "docker-machine.bash" "docker-machine-prompt.bash" )
bundle=""
for file in "${files[@]}"
do
  echo "=> checking file $HOME$file"
  if [[ -e $HOME$file ]]; then
    mv $HOME$file{,.bkp.$(date +%s)} -v
	fi
  bundle="https://raw.githubusercontent.com/hankpillow/dotfiles/master/$file $bundle"
done
curl -O $bundle >> bash_profile
