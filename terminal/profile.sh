#
# profile.sh
#

alias ga="git add"
alias gc="git commit"
alias gf="git fetch --all --prune"
alias gs="git status -s"

alias l="ls -olahF"
alias ccal='cal | sed -e "s/ $(expr `date "+%d"` + 0) / $(printf "\033[32m$(expr `date "+%d"` + 0)\033[0m") /"'
alias vi='vim'
alias reload='bash ~/.bashrc'

if [ "$(uname)" == "Darwin" ]; then
  # Append to the Bash history file, rather than overwriting it
  shopt -s histappend

  # Autocorrect typos in path names when using `cd`
  shopt -s cdspell

  # MAC OS stuff
  defaults write com.apple.Preview NSQuitAlwaysKeepsWindows -bool false
  defaults write com.apple.QuickTimePlayerX NSQuitAlwaysKeepsWindows -bool false
  defaults write com.apple.finder QLEnableTextSelection -bool true
  defaults write com.apple.LaunchServices LSQuarantine -bool NO

  # https://coderwall.com/p/oqtj8w
  set show-all-if-ambiguous on
  set completion-ignore-case on

  alias ls='ls -G'

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then

  if [[ ! -z "$(type xclip)" ]];
  then
    xclip="xclip -selection c"
  fi
  alias ls='ls --color=auto'
  alias ya='yaourt'
fi

git config --global alias.tags 'log --tags --simplify-by-decoration --pretty="format:%ai %d"'
git config --global alias.unstage 'reset HEAD --'
git config --global alias.unmerged 'ls-files -u'
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global push.default simple
git config --global alias.hist 'log --pretty=format:"%Cred%h%Creset	%ad	[%aN]	%s%d " --graph --date=short --abbrev-commit'
git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto
git config --global diff.tool opendiff
git config --global difftool.prompt false
git config --global merge.tool opendiff
git config --global merge.conflictstyle diff3

