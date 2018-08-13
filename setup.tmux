#!/bin/bash
# vim: ft=sh

# brew install tmux
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
cp -v tmux.conf  ~/.tmux.conf

