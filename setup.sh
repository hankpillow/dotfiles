#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
INSTALL="$1"

function backup {
  TARGET=$HOME/$1
  if [[ -e $TARGET ]];
  then
    cp -v "$TARGET" "$TARGET.$(date +%s).bkp"
  fi
}

TMP_PROFILE=""
TMP_OS=""

if [ "$(uname)" == "Darwin" ]; then
  TMP_PROFILE=".bash_profile"
  TMP_OS="Mac"

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  TMP_PROFILE=".bashrc"
  TMP_OS="Linux"

fi

#----- VIM SETUP

backup ".vimrc"
cat ./vimrc.vim > $HOME/.vimrc
echo "+ .vimrc updated"

if [[ $INSTALL == "install" ]]; then
  echo "# VIM FULL INSTALL"
  cd $HOME/.vim/bundle/tern_for_vim && npm install && cd -
fi

#------ GIT setup

backup ".gitconfig"
cat config/gitconfig > $HOME/.gitconfig
echo "+ .gitconfig updated"

#------ TMUX setup

backup ".tmux.conf"
cat config/tmux.conf > $HOME/.tmux.conf
echo '+ .tmux.conf updated'

#------ CTAGS

backup ".ctags"
echo "" > $HOME/.ctags

echo "downloading javacript ctags..."
curl -# -L https://raw.githubusercontent.com/winstonwolff/ctags-javascript-coffeescript/master/ctags.conf > $HOME/.ctags

echo "downloading typescript ctags..."
curl -# -L https://raw.githubusercontent.com/jb55/typescript-ctags/master/.ctags >> $HOME/.ctags

cat config/ctags >> $HOME/.ctags
echo '+ .ctags updated'

#----- linking scripts

ln -s $DIR/script/spider.sh /usr/local/bin/spider
echo " + add command spider to /usr/local/bin"

ln -s $DIR/script/header.sh /usr/local/bin/headers
echo " + add command header to /usr/local/bin"

ln -s $DIR/setup.sh /usr/local/bin/setup-terminal
echo " + add command setup-terminal to /usr/local/bin"

#----- bashrc/bash_profile setup

backup ".bash_profile"
backup ".bashrc"

if [[ $INSTALL == "install" ]]; then

  echo "# FULL INSTALATION"

  echo "# updating git completion script..."
  mkdir ./profile/tmp

  curl -# -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > profile/tmp/git-completion
  curl -# -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > profile/tmp/git-prompt

  if [ $TMP_OS == "Darwin" ]; then

    echo "# updating docker completion script for mac..."
    brew install bash-completion
    curl -# -L https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker > `brew --prefix`/etc/bash_completion.d/docker

  elif [ "$TMP_OS" == "Linux" ]; then

    echo "# updating docker completion script for linux..."
    curl -# -L https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker > /etc/bash_completion.d/docker

  fi

  cat ./profile/tmp/* ./profile/*.sh > $HOME/$TMP_PROFILE
  rm -rf ./profile/tmp

else

  echo "# FAST SETUP"
  cat profile/*.sh > $HOME/$TMP_PROFILE

fi

echo "+ $TMP_PROFILE udpated."
bash $HOME/$TMP_PROFILE
echo "try running './remove_bkp' to cleanup *.bkp files at $HOME"
