#!/bin/bash

if [[ ! -d .cache ]]
then
    mkdir -vp .cache
fi

cd .cache

#Version 3.6.0

VERSION="3.6.0-1"
FILE="fish_${VERSION}~focal_amd64.deb"
if [[ ! -f $FILE ]]
then
    echo "+ download $FILE"
    wget "https://launchpad.net/~fish-shell/+archive/ubuntu/release-3/+files/$FILE"
fi
sudo dpkg -i $FILE
