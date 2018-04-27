#!/bin/bash
# vim: ft=sh

brew install tmux
[[ -f ~/.tmux.conf ]] && cp -v ~/.tmux.conf "$HOME/.tmux.conf$(date +%s).bkp"
cp -v tmux.conf  ~/.tmux.conf

