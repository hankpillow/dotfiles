#REGULAR TEXT COLOR
BLACK='\[\e[0;30m\]'

#BOLD TEXT COLOR
BBLACK='\[\e[1;30m\]'

#BACKGROUND COLOR
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

xclip="xclip -selection c"

source ~/git-prompt.bash
source ~/docker-machine-prompt.bash
source ~/git-completion.bash
source ~/docker-machine.bash

get_ps1(){
	local LAST_STATUS="$GREEN>"
	[[ "$?" -eq 1 ]] &&	LAST_STATUS="$RED!"
	local BRANCH="$(__git_ps1)"
	local DOCKER="$(__docker_machine_ps1)"
	PS1="$MAGENTA\D{%T} \j $CYAN\w$WHITE${BRANCH}\n$BLUE${DOCKER}\u@\h ${LAST_STATUS}$WHITEi "
}

PROMPT_COMMAND=get_ps1
# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export HOME=`echo ~/`

# ENV PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/libexec:$PATH"

# DEFAULTS
export SVN_EDITOR=vim
export EDITOR="vim"
export MANPAGER="less -X"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

export QT_SELECT=5

alias ya='yaourt'
alias dm='docker-machine'
alias dmeval='eval "$(docker-machine env default)"'
alias reload='source ~/.bash_profile'
alias l="ls -oGlahF"
alias fs="stat -f \"%z bytes\""
alias ccal='cal | sed -e "s/ $(expr `date "+%d"` + 0) / $(printf "\033[32m$(expr `date "+%d"` + 0)\033[0m") /"'

git config --global user.name hankpillow
git config --global user.email igor.p.almeida@gmail.com
git config --global alias.unstage 'reset HEAD --'
git config --global alias.unmerged 'ls-files -u'
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global push.default simple
git config --global alias.branches "for-each-ref --sort=committerdate --format='%(refname:short) * %(authorname) * %(committerdate:relative)' refs/remotes/ "
git config --global alias.hist 'log --pretty=format:"%Cred%h%Creset	%ad	[%aN]	%s%d " --graph --date=short --abbrev-commit'
git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto
git config --global diff.tool opendiff
git config --global difftool.prompt false
git config --global merge.tool opendiff
git config --global merge.conflictstyle diff3

function rsa-create(){
	ssh-keygen -t rsa -b 4096 -C "$1"
	rsa-send-to-agent
}

function github-push-ssh(){
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa
}

function docker-clear(){
	docker rm -f "$(docker ps -a -q)"
}
