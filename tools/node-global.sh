#!/bin/bash

if [[ $(which npm) ]];
then
    npm i -g \
        @angular/language-server\
        @johnnymorganz/stylua-bin\
        corepack\
        eslint\
        http-server\
        jfrog-cli-v2-jf\
        vscode-langservers-extracted\
        neovim\
        node-gyp\
        prettier\
        tree-sitter-cli\
        tree-sitter\
        typescript-language-server\
        typescript
fi

