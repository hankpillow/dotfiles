#!/bin/bash

if [[ $(which npm) ]];
then
    npm i -g node-gyp http-server tree-sitter tree-sitter-cli neovim typescript typescript-language-server eslint prettier
fi
