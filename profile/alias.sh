#
# alias.sh
#

alias sudo='sudo '
alias l="ls -olahF"
alias vi='vim'
alias remove_bkp='rm -v ~/.*.bkp'
alias reload_profile='bash ~/.bash_profile'
alias create_rsa='mkdir ~/.ssh && ssh-keygen -t rsa -b 4096 -C "$1" && rsa-send-to-agent && eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa'
alias myip='curl icanhazip.com'

# Tmux
alias tn='tmux new -s'
alias ta='tmux attach '
alias tk='tmux kill-session'

# Docker
alias dlast='docker ps -l'
alias dLast='docker ps -l -q'

alias drunning='docker ps -f "status=running"'
alias dRunning='docker ps -f "status=running" -q'

alias dcomp='docker-compose'
alias dps='docker ps'

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
