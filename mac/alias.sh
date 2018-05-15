#
# alias.sh
#

alias ls='ls -G'
alias mac_refresh_camera='killall VDCAssistant'
alias mac_refresh_finder='killall Finder'
alias ccal='cal | sed -e "s/ $(expr `date "+%d"` + 0) / $(printf "\033[32m$(expr `date "+%d"` + 0)\033[0m") /"'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias l='ls -FGlAhp'
alias less='less -FSRXc'
alias sudo='sudo '
alias du="du -ach"
alias vi='vim'
alias dcomp='docker-compose'
alias fim='vim $(fzf)'

# https://natelandau.com/my-mac-osx-bash_profile/

#   ---------------------------
#   6. NETWORKING
#   ---------------------------

alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias myip='curl ifconfig.co'
alias en0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias en1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='lsof -Pn -i4 | grep LISTEN'

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xjf $1     ;;
			*.tar.gz)    tar xzf $1     ;;
			*.bz2)       bunzip2 $1     ;;
			*.rar)       unrar e $1     ;;
			*.gz)        gunzip $1      ;;
			*.tar)       tar xf $1      ;;
			*.tbz2)      tar xjf $1     ;;
			*.tgz)       tar xzf $1     ;;
			*.zip)       unzip $1       ;;
			*.Z)         uncompress $1  ;;
			*.7z)        7z x $1        ;;
			*)     echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

# --------
# Tmux

alias tn='tmux new -s'
alias ta='tmux attach '
alias tk='tmux kill-session'

# --------
# Docker

# last running container ID
alias drunning='docker ps -f status=running -q'
alias drun='docker ps -f status=running -q | head -1'

# from https://github.com/tcnksm/docker-alias/blob/master/zshrc
# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
dri() { docker rmi $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test
dbu() { docker build -t=$1 .; }

# Show all alias related docker
# dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
# original version wont whow functions
dalias(){ cat ~/.bash_profile | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | grep -v "#" | sort;}

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$2") bash; }
