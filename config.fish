#!/usr/local/bin/fish

set -x LSCOLORS ExFxCxDxBxegedabagacad
set -x LC_CTYPE en_US.UTF-8
set -x EDITOR "vim -f"
set -x GIT_EDITOR "vim -f"

# $PATH equivalent
set -U fish_user_paths /usr/local/bin

# Aliases
alias netCons="lsof -i"
alias myip="curl ifconfig.co"
alias en0="ipconfig getpacket en1 | grep -h ip"
alias en1="ipconfig getpacket en1 | grep -h ip"
alias openPorts="lsof -Pn -i4 | grep LISTEN"

alias cp="cp -iv"
alias mv="mv -iv"
alias mkdir="mkdir -pv"
alias l="ls -lah"
alias less="less -FSRXc"
alias sudo="sudo "
alias du="du -ach"
alias vi="vim"
alias dcomp="docker-compose"

function fim
  vim (fzf)
end
funcsave fim
