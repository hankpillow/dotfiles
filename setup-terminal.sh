#
# bash_profile
#

if [[ -e $HOME/.bash_profile ]];
then
  cp -v "$HOME/.bash_profile" "$HOME/.bash_profile.$(date +%s).bkp"
fi

if [[ "$1" != "fast" ]]; then

  if [ "$(uname)" == "Darwin" ]; then
    brew install bash-completion
    curl -L https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker > `brew --prefix`/etc/bash_completion.d/docker

  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    curl -L https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker > /etc/bash_completion.d/docker

  fi

  echo "update autocomplete tools..."
  mkdir ./terminal/tmp
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > terminal/tmp/git-completion
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > terminal/tmp/git-prompt

  cat terminal/tmp/* terminal/*.sh > $HOME/.bash_profile
  rm -rf ./terminal/tmp

else
  cat terminal/*.sh > $HOME/.bash_profile

fi

#
# gitconfig
#

if [[ -e $HOME/.gitconfig ]];
then
  cp -v "$HOME/.gitconfig" "$HOME/.gitconfig.$(date +%s).bkp"
fi
cat terminal/.gitconfig > $HOME/.gitconfig
echo '.gitconfig updated'

#
# tmux
#

if [[ -e $HOME/.tmux.conf ]];
then
  cp -v "$HOME/.tmux.conf" "$HOME/.tmux.conf.$(date +%s).bkp"
fi
cat terminal/.tmux.conf > $HOME/.tmux.conf
echo '.tmux.conf updated'

#
# bashrc
#

if [[ -e $HOME/.bashrc ]];
then
  bash $HOME/.bashrc
else
  bash $HOME/.bash_profile
fi
echo 'terminal updated.'
