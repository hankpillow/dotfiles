#!/bin/bash

if [[ ! -d .cache ]]
then
    mkdir -vp .cache
fi

cd .cache

VERSION="14.1.0"
FILE="ripgrep_14.1.0-1_amd64.deb"
if [[ ! -f $FILE ]]
then
    echo "+ download $FILE"
    wget "https://github.com/BurntSushi/ripgrep/releases/download/${VERSION}/$FILE"
fi
sudo dpkg -i $FILE
