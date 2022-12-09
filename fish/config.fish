
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
alias l="ls -1a"
alias ll="ls -lahg"
alias mkdir="mkdir -pv"
alias mv="mv -iv"
alias myip4='dig @resolver1.opendns.com ANY myip.opendns.com +short -4'
alias myip6='dig @resolver1.opendns.com ANY myip.opendns.com +short'
alias myip="curl ifconfig.co"
alias myip="curl ifconfig.co"
alias ports="lsof -Pn -i4 | grep LISTEN"
alias ports="lsof -Pn -i4 | grep LISTEN"
alias sudo="sudo "
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

## start asdf
source ~/.asdf/asdf.fish
# needs this command too
# mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
