#!/bin/bash

if [[ $(which npm) ]];
then
    npm i -g \
        @angular/language-server\
        @johnnymorganz/stylua-bin\
        corepack\
        eslint\
        http-server\
        vscode-langservers-extracted\
        neovim\
        node-gyp\
        prettier\
        tree-sitter-cli\
        tree-sitter\
        typescript-language-server\
        typescript
fi

