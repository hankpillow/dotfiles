#!/bin/bash
sudo apt-get update
sudo apt-get -y install\
	fzf fd-find ripgrep silversearcher-ag neovim\
	python3-neovim  python3 python3-pip python3.8-venv\
	ninja-build make clang vim zip curl wget

pip install codespell

if [[ $(which node) ]];
then
	npm i -g node-gyp http-server
	# npm i -g eslint_d @fsouza/prettierd tree-sitter-cli vscode-langservers-extracted http-server
fi

