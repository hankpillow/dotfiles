#
# profile.sh
#

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
  defaults write com.apple.finder AppleShowAllFiles YES
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
