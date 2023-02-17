#!/bin/bash
# https://github.com/ggreer/the_silver_searcher
if [[ ! -d .cache ]]
then
    mkdir -vp .cache
fi

cd .cache

VERSION="2.2.0"
FILE="the_silver_searcher-${VERSION}.tar.gz"
FILE_TAR="the_silver_searcher-${VERSION}.tar"
AG_DIR="the_silver_searcher-${VERSION}"
if [[ ! -f .cache/$FILE ]]
then
    echo "+ download $FILE"
    wget https://geoff.greer.fm/ag/releases/$FILE
fi
gunzip $FILE
tar -xf $FILE_TAR
cd $AG_DIR
sudo ./configure
sudo make
sudo make install


