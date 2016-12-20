#
# alias.sh
#

alias l="ls -olahF"
alias ccal='cal | sed -e "s/ $(expr `date "+%d"` + 0) / $(printf "\033[32m$(expr `date "+%d"` + 0)\033[0m") /"'
alias vi='vim'
alias reload='bash ~/.bashrc'
alias mac_refresh_camera='killall VDCAssistant'
alias mac_refresh_finder='killall Finder'
alias docker_clear='docker rm -f "$(docker ps -a -q)"'
alias pacman_stop='rm /var/lib/pacman/db.lck'
alias ip='ifconfig'
alias create_rsa='ssh-keygen -t rsa -b 4096 -C "$1" && rsa-send-to-agent && eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa'
alias tk='tmux kill-session'

if [ "$(uname)" == "Darwin" ]; then
  alias ls='ls -G'
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  alias ls='ls --color=auto'
  alias ya='yaourt'
fi
