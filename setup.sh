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
cat ./config/vim-{preinstall,plugin,helpers,settings,theme}.vim > $HOME/.vimrc
echo "+ .vimrc updated"

if [[ $INSTALL == "install" ]]; then
  echo "# VIM FULL INSTALL"
  vim +PlugUpdate +qall
fi

#------ GIT setup

backup ".gitconfig"
cat config/gitconfig > $HOME/.gitconfig
echo "+ .gitconfig updated"

#------ TMUX setup

backup ".tmux.conf"
cat config/tmux > $HOME/.tmux.conf
echo '+ .tmux.conf updated'

#------ CTAGS

# backup ".ctags"
# echo "" > $HOME/.ctags

# echo "downloading javacript ctags..."
# curl -# -L https://raw.githubusercontent.com/winstonwolff/ctags-javascript-coffeescript/master/ctags.conf > $HOME/.ctags

# echo "downloading typescript ctags..."
# curl -# -L https://raw.githubusercontent.com/jb55/typescript-ctags/master/.ctags >> $HOME/.ctags

# cat config/ctags >> $HOME/.ctags
# echo '+ .ctags updated'

#----- linking scripts

test ! -L /usr/local/bin/spider && ln -s $DIR/script/spider.sh /usr/local/bin/spider
echo "+ add command spider to /usr/local/bin"

test ! -L /usr/local/bin/headers && ln -s $DIR/script/header.sh /usr/local/bin/headers
echo "+ add command headers to /usr/local/bin"

test ! -L /usr/local/bin/docker-logs && ln -s $DIR/script/docker-logs.sh /usr/local/bin/docker-logs
echo "+ add command docker-logs to /usr/local/bin"

test ! -L /usr/local/bin/setup-terminal && ln -s $DIR/setup.sh /usr/local/bin/setup-terminal
echo "+ add command setup-terminal to /usr/local/bin"

#----- bashrc/bash_profile setup

backup ".bash_profile"
backup ".bashrc"

echo "# downloading git-completion..."
mkdir -v ./profile/tmp

curl --silent -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > profile/tmp/git-completion
curl --silent -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > profile/tmp/git-prompt

if [ $TMP_OS == "Linux" ]; then

  echo "# updating docker completion script for linux..."
  curl -# -L https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker > /etc/bash_completion.d/docker

fi

# concat completion tools with all profile's config
cat ./profile/tmp/* ./profile/*.sh > $HOME/$TMP_PROFILE
rm -rfv ./profile/tmp

echo "+ $TMP_PROFILE udpated."
bash $HOME/$TMP_PROFILE
echo "try running './remove_bkp' to cleanup *.bkp files at $HOME"
