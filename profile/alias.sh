#
# alias.sh
#

alias sudo='sudo '
alias l="ls -olahF"
alias du="du -ach"
alias mdir="mkdir -pv"
alias vi='vim'
alias remove_bkp='rm -v ~/.*.bkp'
alias reload_profile='bash ~/.bash_profile'
alias create_rsa='mkdir ~/.ssh && ssh-keygen -t rsa -b 4096 -C "$1" && rsa-send-to-agent && eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa'
alias myip="curl http://ipecho.net/plain; echo"
alias ports='lsof -Pn -i4 | grep LISTEN'
alias fvim='vim $(fzf)'

# Tmux
alias tn='tmux new -s'
alias ta='tmux attach '
alias tk='tmux kill-session'

# Docker

# last running container ID
alias drun='docker ps -f status=running -q'

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
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }
alias dcomp='docker-compose'

# MacOS
if [ "$(uname)" == "Darwin" ]; then

  alias ls='ls -G'
  alias mac_refresh_camera='killall VDCAssistant'
  alias mac_refresh_finder='killall Finder'
  alias ccal='cal | sed -e "s/ $(expr `date "+%d"` + 0) / $(printf "\033[32m$(expr `date "+%d"` + 0)\033[0m") /"'

# Linux (working on Arch)
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then

  alias ls='ls --color=auto'
  alias pacman_stop='rm /var/lib/pacman/db.lck'
  alias ya='yaourt'
  alias pacman_refresh_keys='pacman-key --refresh-keys'

fi
