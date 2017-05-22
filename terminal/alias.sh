#
# alias.sh
#

alias l="ls -olahF"
alias vi='vim'
alias reload='bash ~/.bashrc'
alias create_rsa='ssh-keygen -t rsa -b 4096 -C "$1" && rsa-send-to-agent && eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa'
alias tm='tmux'
alias tn='tmux new -s'
alias ta='tmux attach '
alias tk='tmux kill-session'
alias dl='docker ps -l -q'
alias dup='docker ps -f "stauts=running" -q'
alias dcom='docker-compose'
alias myip='curl icanhazip.com'

if [ "$(uname)" == "Darwin" ]; then

  alias ls='ls -G'
  alias mac_refresh_camera='killall VDCAssistant'
  alias mac_refresh_finder='killall Finder'
  alias ccal='cal | sed -e "s/ $(expr `date "+%d"` + 0) / $(printf "\033[32m$(expr `date "+%d"` + 0)\033[0m") /"'

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then

  alias ls='ls --color=auto'
  alias pacman_stop='rm /var/lib/pacman/db.lck'
  alias ya='yaourt'
  alias refresh_keys='pacman-key --refresh-keys'

fi
