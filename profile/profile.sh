#
# profile.sh
#

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

  [ -f ~/.fzf.bash ] && source ~/.fzf.bash

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then

  if [[ ! -z "$(type xclip)" ]];
  then
    xclip="xclip -selection c"
  fi
fi
