#!/usr/bin/env fish

# set vars
# set -x LSCOLORS ExFxCxDxBxegedabagacad
# set -x LC_CTYPE en_US.UTF-8
set -x EDITOR "vim -f"
set -x GIT_EDITOR "vim -f"
set -x PATH /usr/local/bin $PATH

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
alias fim="vim (fzf)"

## tmux
alias tn="tmux new -s"
alias ta="tmux attach "
alias tk="tmux kill-session"

## docker
alias dcomp="docker-compose"
alias drunning="docker ps -f status=running -q"
alias drun="docker ps -f status=running -q | head -1"

# from https://github.com/tcnksm/docker-alias/blob/master/zshrc
alias dl="docker ps -l -q"
alias dps="docker ps"
alias dpa="docker ps -a"
alias di="docker images"
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias dex="docker exec -i -t"

#fisher
## fzf
set -x FZF_COMPLETE 1
set -x FZF_TMUX 1
set -x FZF_DEFAULT_OPTS '--height 40% --reverse --border'
