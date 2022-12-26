#!/bin/bash
sudo apt-get update
sudo apt-get -y install\
	fzf fd-find ripgrep silversearcher-ag neovim\
	python3-neovim  python3 python3-pip\
	ninja-build make clang

pip install codespell

if [[ $(which node) ]];
then
	npm i -g node-gyp
	npm i -g eslint_d @fsouza/prettierd tree-sitter-cli vscode-langservers-extracted http-server
fi

echo install lua lsp https://github.com/sumneko/lua-language-server/wiki/Getting-Started#command-line
