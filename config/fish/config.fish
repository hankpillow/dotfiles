#!/usr/bin/env fish


# set -gx LSCOLORS gxfxcxdxbxegedabagacad
set -xU EDITOR "vim -f"
set -xU GIT_EDITOR "vim -f"
set -xU LC_CTYPE "en_US.UTF-8"
set -xU DISPLAY ":0"
set -xU PATH $HOME/bin/ $PATH 
set -xU PATH /usr/local/bin $PATH
set -gx CLICOLOR 1
set -gx TERM xterm-256color

if [ (uname -a | grep -i "ubuntu") ]
	echo "ubuntu"
	set -gx PATH "$HOME/.local/bin" $PATH
	export SDKMAN_DIR="/home/osboxes/.sdkman"
	[[ -s "/home/osboxes/.sdkman/bin/sdkman-init.sh" ]] && source "/home/osboxes/.sdkman/bin/sdkman-init.sh"
else
	echo "mac"
	set -xU PATH $HOME/Library/Python/2.7/bin
end

# Aliases

alias curla='curl -H '\''Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-nonces,akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no'\'''
alias curlah='curl -I -X GET -H '\''Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-nonces,akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no'\'''
alias wgeta='wget -S --header='\''Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-nonces,akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no'\'''
alias trar='tar -cvzf'
alias untar='tar -xvzf'
alias pbcopy='clip.exe'
alias gb='git branch | grep "*" | sed "s/* //"'

alias fim="fzf | vim -"
alias myip="curl ifconfig.co"
alias en0="ipconfig getpacket en1 | grep -h ip"
alias en1="ipconfig getpacket en1 | grep -h ip"
alias ports="lsof -Pn -i4 | grep LISTEN"

alias gr="cd (git rev-parse --show-toplevel)"
alias cp="cp -iv"
alias mv="mv -iv"
alias mkdir="mkdir -pv"
alias ll="ls -hao"
alias l="ls -1"
alias less="less -FSRXc"
alias sudo="sudo "
alias du="du -ach"
alias vi="vim"

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

# for fisher
for file in ~/.config/fish/conf.d/*.fish
  source $file
end

