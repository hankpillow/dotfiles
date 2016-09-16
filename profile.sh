if [ "$(uname)" == "Darwin" ]; then
	# Append to the Bash history file, rather than overwriting it
	shopt -s histappend

	# Autocorrect typos in path names when using `cd`
	shopt -s cdspell

	# MAC OS stuff
	#launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist
	defaults write com.apple.Preview NSQuitAlwaysKeepsWindows -bool false
	defaults write com.apple.QuickTimePlayerX NSQuitAlwaysKeepsWindows -bool false
	defaults write com.apple.finder QLEnableTextSelection -bool true
	defaults write com.apple.LaunchServices LSQuarantine -bool NO
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	if [[ ! -z "$(type xclip)" ]];
	then
		xclip="xclip -selection c"
	fi
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under Windows NT platform
fi

git config --global alias.tags 'log --tags --simplify-by-decoration --pretty="format:%ai %d"'
git config --global alias.unstage 'reset HEAD --'
git config --global alias.unmerged 'ls-files -u'
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global push.default simple
git config --global alias.hist 'log --pretty=format:"%Cred%h%Creset	%ad	[%aN]	%s%d " --graph --date=short --abbrev-commit'
git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto
git config --global diff.tool opendiff
git config --global difftool.prompt false
git config --global merge.tool opendiff
git config --global merge.conflictstyle diff3
