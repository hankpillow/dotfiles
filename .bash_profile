if [[ ! -z "$(type xclip)" ]];
then
	xclip="xclip -selection c"
fi

while IFS= read -r file
do
  if [[ -e $HOME$file ]]; then
    echo "backup file $HOME$file"
    mv $HOME$file{,.bkp.$(date +%s)}
	fi
  echo "copying $HOME$file"
  cp $file $HOME$file -v
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

#git config --global alias.tags 'log --tags --simplify-by-decoration --pretty="format:%ai %d"'
#git config --global alias.unstage 'reset HEAD --'
#git config --global alias.unmerged 'ls-files -u'
#git config --global alias.co checkout
#git config --global alias.ci commit
#git config --global alias.st status
#git config --global push.default simple
#git config --global alias.hist 'log --pretty=format:"%Cred%h%Creset	%ad	[%aN]	%s%d " --graph --date=short --abbrev-commit'
#git config --global color.branch auto
#git config --global color.diff auto
#git config --global color.interactive auto
#git config --global color.status auto
#git config --global diff.tool opendiff
#git config --global difftool.prompt false
#git config --global merge.tool opendiff
#git config --global merge.conflictstyle diff3
