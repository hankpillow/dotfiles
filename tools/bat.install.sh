#!/bin/bash

if [[ ! -d .cache ]]
then
    mkdir -vp .cache
fi

cd .cache

VERSION="0.22.1"
FILE="bat-musl_${VERSION}_amd64.deb"
if [[ ! -f .cache/$FILE ]]
then
    echo "+ download $FILE"
    wget "https://github.com/sharkdp/bat/releases/download/v${VERSION}/${FILE}"
fi
sudo dpkg -i $FILE
