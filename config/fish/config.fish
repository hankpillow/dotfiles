#!/usr/bin/env fish
#

if ! functions -q git_is_repo
  echo install fish-git-util for better prompt
  echo fisher add fishpkg/fish-git-util
end

set -x MATCHPEDIA_TOKEN 1130f9234ce958e2e5ef057e773d74ee00

set -xU EDITOR "vim -f"
set -xU GIT_EDITOR "vim -f"
set -xU LC_CTYPE "en_US.UTF-8"
set -xU DISPLAY ":0"
set -xU PATH $HOME/bin/ $PATH
set -xU PATH /usr/local/bin $PATH
set -x UID (id -u)
set -x GID (id -g)
set -gx CLICOLOR 1
# set -gx TERM xterm-256color

if [ (uname -a | grep -i "ubuntu") ]
  echo "ubuntu"
  set -gx PATH "$HOME/.local/bin" $PATH
end

# Aliases
alias curla='curl -H '\''Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-nonces,akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no'\'''
alias wgeta='wget -S --header='\''Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-nonces,akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no'\'''
alias trar='tar -cvzf'
alias untar='tar -xvzf'
alias copy='xsel -ib'
alias paste='xsel -b'
alias gb='git branch | grep "*" | sed "s/* //"'
alias open='xdg-open'
alias myip4='dig @resolver1.opendns.com ANY myip.opendns.com +short -4'
alias myip6='dig @resolver1.opendns.com ANY myip.opendns.com +short'

alias fim="fzf | vim -"
alias myip="curl ifconfig.co"
alias en0="ipconfig getpacket en1 | grep -h ip"
alias en1="ipconfig getpacket en1 | grep -h ip"
alias ports="lsof -Pn -i4 | grep LISTEN"

alias gr="cd (git rev-parse --show-toplevel)"
alias cp="cp -iv"
alias mv="mv -iv"
alias mkdir="mkdir -pv"
alias ll="ls -ha"
alias l="ls -1"
alias less="less -FSRXc"
alias sudo="sudo "
alias duh="du -ach"
alias vi="vim"

## tmux
alias tn="tmux new -s"
alias ta="tmux attach "
alias tk="tmux kill-session"

## docker
alias dc="docker-compose"
alias drun="docker ps -f status=running -q"
alias druns="docker ps -f status=running -q | head -1"

# from https://github.com/tcnksm/docker-alias/blob/master/zshrc
alias dl="docker ps -l -q"
alias dps="docker ps"
alias dpa="docker ps -a"
alias di="docker images"
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias dex="docker exec -i -t"

#hugo static site builder
#
# alias hugo="docker run -u hugo --rm -it -v $PWD:/src jguyomard/hugo-builder hugo"
# alias hugo-server="docker run -u hugo  --rm -it -v $PWD:/src -p 1313:1313 jguyomard/hugo-builder hugo server --bind 0.0.0.0"

#fisher
## fzf
set -x FZF_COMPLETE 1
set -x FZF_TMUX 1
set -x FZF_DEFAULT_OPTS '--height 40% --reverse --border'

# for fisher
for file in ~/.config/fish/conf.d/*.fish
  source $file
end

# The .ssh folder: 700 (drwx------)
chmod 700 ~/.ssh
# The private key: 600 (-rw-------)
chmod 644 ~/.ssh/*.pub
# The public key: 644 (-rw-r--r--)
ls ~/.ssh/* | grep -v pub | xargs chmod 600

# newgrp docker
# echo "force docker group do work without sudo"
