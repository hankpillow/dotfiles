[[ -r ~/.bashrc ]] && . ~/.bashrc

#export PS1='\[\e[1;30m\]\t`if [ $? = 0 ]; then echo "\[\e[32m\] \u"; else echo "\[\e[31m\] \u"; fi`\[\e[0m\]@\h \j \w \n$ '

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
# Highlight section titles in manual pages

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

alias dm='docker-machine'
alias reload='. ~/.bash_profile'
alias l="ls -oGlahF"
alias fs="stat -f \"%z bytes\""
alias ccal='cal | sed -e "s/ $(expr `date "+%d"` + 0) / $(printf "\033[32m$(expr `date "+%d"` + 0)\033[0m") /"'

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
