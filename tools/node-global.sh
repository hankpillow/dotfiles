#!/bin/bash

if [[ $(which npm) ]];
then
	npm i -g node-gyp http-server tree-sitter tree-sitter-cli neovim
fi
