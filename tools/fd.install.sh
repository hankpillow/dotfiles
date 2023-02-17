#!/bin/bash

if [[ ! -d .cache ]]
then
    mkdir -vp .cache
fi

cd .cache

VERSION="8.6.0"
FILE="fd-musl_${VERSION}_amd64.deb"
if [[ ! -f .cache/$FILE ]]
then
    echo "+ download $FILE"
    wget "https://github.com/sharkdp/fd/releases/download/v${VERSION}/${FILE}"
fi
sudo dpkg -i $FILE

