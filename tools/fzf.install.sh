#!/bin/bash

if [[ ! -d .cache ]]
then
    mkdir -vp .cache
fi

cd .cache

git clone --depth 1 https://github.com/junegunn/fzf.git .cache/fzf
.cache/fzf/install
