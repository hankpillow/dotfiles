
source ~/Dropbox/System/git-completion.bash

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

# execute permissions to personal scripts
chmod +x ~/Dropbox/System/bin/*

#Regular text color
BLACK='\[\e[0;30m\]'
#Bold text color
BBLACK='\[\e[1;30m\]'
#background color
BGBLACK='\[\e[40m\]'
RED='\[\e[0;31m\]'
BRED='\[\e[1;31m\]'
BGRED='\[\e[41m\]'
GREEN='\[\e[0;32m\]'
BGREEN='\[\e[1;32m\]'
BGGREEN='\[\e[1;32m\]'
YELLOW='\[\e[0;33m\]'
BYELLOW='\[\e[1;33m\]'
BGYELLOW='\[\e[1;33m\]'
BLUE='\[\e[0;34m\]'
BBLUE='\[\e[1;34m\]'
BGBLUE='\[\e[1;34m\]'
MAGENTA='\[\e[0;35m\]'
BMAGENTA='\[\e[1;35m\]'
BGMAGENTA='\[\e[1;35m\]'
CYAN='\[\e[0;36m\]'
BCYAN='\[\e[1;36m\]'
BGCYAN='\[\e[1;36m\]'
WHITE='\[\e[0;37m\]'
BWHITE='\[\e[1;37m\]'
BGWHITE='\[\e[1;37m\]'

get_ps1(){
local LAST_STATUS="$GREEN>"
[[ "$?" -eq 1 ]] &&	LAST_STATUS="$RED!"
local BRANCH="$(__git_ps1)"
PS1="$BLACK\D{%T} \j$YELLOW${BRANCH} $BLACK\u@\h $BLUE\W\n${LAST_STATUS} $WHITE"
}
PROMPT_COMMAND=get_ps1

function docker-clear{
	docker rm -f $(docker ps -a -q)
}

function browse-docker {
	`open: "http://$(docker-machine ip default):8080"`
}
