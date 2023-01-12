#!/bin/bash
sudo apt-get update
sudo apt-get -y install\
	bat fzf fd-find ripgrep silversearcher-ag neovim\
	python3-neovim  python3 python3-pip python3.8-venv\
	build-essential libreadline-dev cmake awscli\
	ninja-build make clang vim unzip zip curl wget

pip install codespell

if [[ $(which npm) ]];
then
	npm i -g node-gyp http-server stylelint eslint lua-format typescript ts-node
fi

# mkdir -p ~/workspace
# # install lua
# cd ~/workspace
# curl -R -O http://www.lua.org/ftp/lua-5.3.5.tar.gz
# tar -zxf lua-5.3.5.tar.gz
# cd lua-5.3.5
# make linux test
# sudo make install
# cd .. 
# rm lua-5.3.5.tar.gz

# install luarocks
# cd ~/workspace
# wget https://luarocks.org/releases/luarocks-3.8.0.tar.gz
# tar zxpf luarocks-3.8.0.tar.gz
# cd luarocks-3.8.0
# ./configure --with-lua-include=/usr/local/include
# make
# make install

# lua formatter
# https://github.com/Koihik/LuaFormatter

