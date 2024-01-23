#!/bin/bash

if [ -f ~/.tmux.conf ] || [ -L ~/.tmux.conf ] ; then
    echo "~/.tmux.conf already exist!" 
    exit 1
fi

ln -vs $PWD/tmux/.tmux.conf ~/.tmux.conf
