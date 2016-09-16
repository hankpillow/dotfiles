#git
alias ga="git add"
alias gc="git commit"
alias gca="git commit -a"
alias gcb="git create-branch"
alias gconflict="git diff --name-only --diff-filter=U"
alias gf="git fetch --all --prune"
alias gs="git status -s"

alias dm='docker-machine'
alias dmeval='eval "$(docker-machine env default)"'

alias ls='ls --color=auto'
alias l="ls -olahF"

alias ccal='cal | sed -e "s/ $(expr `date "+%d"` + 0) / $(printf "\033[32m$(expr `date "+%d"` + 0)\033[0m") /"'
alias vi='vim'
alias reload='source ~/.bash_profile'
alias ya='yaourt'
