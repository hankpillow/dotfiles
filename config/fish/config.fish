#!/usr/bin/env fish

set PATH $PATH  ~/bin/
export PATH

# set -gx LSCOLORS gxfxcxdxbxegedabagacad
set -xU LS_COLORS "rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;44:ow=33:st=37;44:ex=34:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"
set -xU EDITOR "vim -f"
set -xU GIT_EDITOR "vim -f"
set -xU LC_CTYPE "en_US.UTF-8"
set -xU PATH /usr/local/bin $PATH
set -gx CLICOLOR 1
set -gx TERM xterm-256color

# Aliases
#
# Useful bash aliases for debugging Akamai proxy responses

alias curla='curl -H '\''Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-nonces,akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no'\'''
alias curlah='curl -I -X GET -H '\''Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-nonces,akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no'\'''
alias wgeta='wget -S --header='\''Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-nonces,akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no'\'''

alias netCons="lsof -i"
alias myip="curl ifconfig.co"
alias en0="ipconfig getpacket en1 | grep -h ip"
alias en1="ipconfig getpacket en1 | grep -h ip"
alias openPorts="lsof -Pn -i4 | grep LISTEN"

alias cp="cp -iv"
alias mv="mv -iv"
alias mkdir="mkdir -pv"
alias ll="ls -lah"
alias l="ls -1"
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

# for fisher
for file in ~/.config/fish/conf.d/*.fish
  source $file
end

