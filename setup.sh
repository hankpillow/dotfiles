files=( "git-completion.bash" "git-prompt.bash" "docker-machine.bash" "docker-machine-prompt.bash" "ps1.sh" "alias.sh" "helpers.sh" "export.sh" )
bundle=""
for file in "${files[@]}"
do
  if [[ -e $HOME$file ]]; then
    mv $HOME$file{,.bkp.$(date +%s)} -v
	fi
  bundle="https://raw.githubusercontent.com/hankpillow/dotfiles/master/$file $bundle"
done
echo "$bundle"
curl -O "$bundle" >> bash_profile
