alias cp="cp -iv"
alias dir='dir --color=auto'
alias duh="du -ach"
alias en0="ipconfig getpacket en1 | grep -h ip"
alias en0="ipconfig getpacket en1 | grep -h ip"
alias en1="ipconfig getpacket en1 | grep -h ip"
alias en1="ipconfig getpacket en1 | grep -h ip"
alias fvim="vim (fzf)"
alias gb='git branch | grep "*" | sed "s/* //"'
alias grep='grep --color=auto'
alias l="ls -1a --color"
alias ll="ls -lah --color"
alias mkdir="mkdir -pv"
alias mv="mv -iv"
alias myip4='dig @resolver1.opendns.com ANY myip.opendns.com +short -4'
alias myip6='dig @resolver1.opendns.com ANY myip.opendns.com +short'
alias myip="curl ifconfig.co"
alias myip="curl ifconfig.co"
alias ports="lsof -Pn -i4 | grep LISTEN"
alias ports="lsof -Pn -i4 | grep LISTEN"
alias sudo="sudo "

alias gpush='git push origin -u $(gb)'
alias vi="nvim"

#tmux
alias tn="tmux new -s"
alias ta="tmux attach "
alias tk="tmux kill-session"

## docker
alias dc="docker-compose"
alias drun="docker ps -f status=running -q"
alias druns="docker ps -f status=running -q | head -1"
alias dl="docker ps -l -q"
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias dexec="docker exec -i -t"

alias luamake=/home/igor/workspace/lua-language-server/3rd/luamake/luamake

# asdf initialization
if [[ -d $HOME/.asdf ]]; 
then
	. "$HOME/.asdf/asdf.sh"
	. "$HOME/.asdf/completions/asdf.bash"
fi

if [[ -d $HOME/.cargo ]]; 
then
 . "$HOME/.cargo/env"
fi

source /usr/lib/git-core/git-sh-prompt
source /usr/share/doc/fzf/examples/key-bindings.bash
source /usr/share/doc/fzf/examples/completion.bash

# user@host location\n (git branch) $prompt
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\n$(__git_ps1 "(%s)") \$ '
# location (git_branc) $prompt
PS1='\[\033[01;34m\]\w\[\033[00m\] $(__git_ps1 "(%s)")\$ '

echo welcome $USER
cd $HOME
