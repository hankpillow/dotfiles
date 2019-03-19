#!/bin/bash

if [[ ! -n  "$(grep "fish" /etc/shells)" ]]; then
	echo "/usr/bin/fish" | sudo tee -a /etc/shells
fi
# mac os chsh -s /usr/local/bin/fish
chsh -s /usr/bin/fish
