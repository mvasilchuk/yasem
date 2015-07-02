#!/bin/sh
SOURCES_DIR=`pwd`
THIRD_PARTY_DIR=$SOURCES_DIR/third_party

LIBAV_DIR=$THIRD_PARTY_DIR/libav

if [ ! -d $THIRD_PARTY_DIR ]; then
    mkdir $THIRD_PARTY_DIR
fi

if [ ! -d $LIBAV_DIR ]; then
    git clone git://git.libav.org/libav.git $LIBAV_DIR
else
    cd $LIBAV_DIR && git pull origin master
fi

./configure
make

cd $SOURCES_DIR

