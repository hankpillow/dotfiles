while IFS= read -r file
do
  if [[ -e $HOME$file ]]; then
    mv $HOME$file{,.bkp.$(date +%s)} -v
	fi
  curl "https://raw.githubusercontent.com/hankpillow/dotfiles/master/$file" > "$home$file"
  #create an option for local copy
  #cp $file $HOME$file -v
done <<- EOM
git-completion.bash
git-prompt.bash
docker-machine.bash
docker-machine-prompt.bash
ps1.sh
alias.sh
helper.sh
export.sh
EOM
