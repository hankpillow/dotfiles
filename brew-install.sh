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
  trash \
  fzf \
  python \
  tmux \
  the_silver_searcher \
  rg \
  jq \
  ctags \
  bash-completion \
  httpie \
  wget \
  vim \
  mono \
  git-extras

curl -L https://raw.githubusercontent.com/docker/compose/1.16.1/contrib/completion/bash/docker-compose > /usr/local/etc/bash_completion.d/docker-compose

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f $(brew --prefix)/opt/fzf/install ]; then
  $(brew --prefix)/opt/fzf/install
fi

