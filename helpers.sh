alias ga="git add"
alias gc="git commit"
alias gf="git fetch --all --prune"
alias gs="git status -s"

alias l="ls -olahF"
alias ccal='cal | sed -e "s/ $(expr `date "+%d"` + 0) / $(printf "\033[32m$(expr `date "+%d"` + 0)\033[0m") /"'
alias vi='vim'
alias reload='bash ~/.bashrc'

function setup-profile(){
	curl "https://raw.githubusercontent.com/hankpillow/dotfiles/master/setup-profile.sh" | bash
}

function setup-vim(){
	curl "https://raw.githubusercontent.com/hankpillow/dotfiles/master/setup-vim.sh" | bash
}

function ip(){
  echo "$(ifconfig $1 2>/dev/null|awk '/inet / {print $2}'|sed 's/addr://')"
}

function rsa-create(){
  ssh-keygen -t rsa -b 4096 -C "$1"
  rsa-send-to-agent
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
}

function docker-clear(){
  docker rm -f "$(docker ps -a -q)"
}

function pacman-stop(){
  rm /var/lib/pacman/db.lck
}
