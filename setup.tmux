#!/bin/bash
# vim: ft=sh

[[ -f ~/.tmux.conf ]] && cp -v ~/.tmux.conf "$HOME/.tmux.conf$(date +%s).bkp"
cp -v tmux.conf  ~/.tmux.conf

