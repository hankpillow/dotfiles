#
# helpers.sh
#

function setup-profile(){
  curl "https://raw.githubusercontent.com/hankpillow/dotfiles/master/setup-profile.sh" | bash
}

function setup-vim(){
  curl "https://raw.githubusercontent.com/hankpillow/dotfiles/master/setup-vim.sh" | bash
}

function update-vim(){
  curl "https://raw.githubusercontent.com/hankpillow/dotfiles/master/vimrc" > $HOME/.vimrc
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

