#!/bin/sh

if ! [ -x "$(command -v brew)" ]; then
  echo '-----'
  echo 'first you need brew'
  echo 'this can take a while...'
  echo '-----'
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

ACTION=${1:-"install"}

brew $ACTION reattach-to-user-namespace \
  bash-completion \
  ctags \
  fd \
  fzf \
  git-extras \
  httpie \
  jq \
  mono \
  python \
  rg \
  the_silver_searcher \
  tmux \
  trash \
  vim \
  wget

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f $(brew --prefix)/opt/fzf/install ]; then
  $(brew --prefix)/opt/fzf/install
fi

