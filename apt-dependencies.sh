#!/bin/bash
sudo apt-get update
sudo apt-get -y install\
	python3-neovim  python3 python3-pip python3.8-venv\
	build-essential libreadline-dev cmake awscli\
	libpcre3-dev liblzma-dev pkg-config xdg-utils ninja-build \
	make clang vim unzip zip curl wget

