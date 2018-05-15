#!/bin/bash

if [[ ! -n  "$(grep "fish" /etc/shells)" ]]; then
	echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
fi
chsh -s /usr/local/bin/fish
