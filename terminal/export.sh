#
# export.sh
#

export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export HOME=`echo ~/`

# create a default workspace at user's HOME directory
if [ ! -d "$HOME/workspace" ]; then
  echo "creating workspace folder at $HOME"
  mkdir -v $HOME/workspace
fi
export WORKSPACE=`echo $HOME/workspace`

export EDITOR="vim"
export MANPAGER="less -X"

export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

export QT_SELECT=5

# ENV PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/libexec:$PATH"

if [ -d "$WORKSPACE/google-cloud-sdk/bin" ]; then
  export PATH="$WORKSPACE/google-cloud-sdk/bin:$PATH"
fi
