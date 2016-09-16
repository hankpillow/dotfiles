# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"
export HOME=`echo ~/`
export WORKDIR=`echo ~/Documents`

# ENV PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/libexec:$PATH"

# DEFAULTS
export SVN_EDITOR=vim
export EDITOR="vim"
export MANPAGER="less -X"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

export QT_SELECT=5
