#!/usr/bin/env bash

##############################################################################
##  global variable define
##############################################################################
ARCH="noarch"
OS="unknown"

## profile list
BASH_PROFILE=$HOME/.bash_profile
GIT_PROFILE=$HOME/.gitconfig

if [ $OSTYPE == linux-gnu ]; then
    OS="linux" 
elif [ $OSTYPE == darwin11 ]; then
    OS="mac" 
elif [ $OSTYPE == darwin12 ]; then
    OS="mac" 
elif [ $OSTYPE == darwin13 ]; then
    OS="mac" 
elif [ $OSTYPE == cygwin ]; then
    OS="cygwin"
elif [ $OSTYPE == win32 ]; then
    OS="win32"
elif [ $OSTYPE == freebsd ]; then
    OS="bsd"
else
    OS="unknown"
fi

echo $OS

if [ "$OS" == mac ]; then
    CURDIR=$PWD
else
    CURDIR=`dirname $(readlink -f $0)`
fi

echo $CURDIR

echo $BASH_PROFILE

# symlink .bash_profile
if [ -f $BASH_PROFILE ]; then
    mv "$BASH_PROFILE" "$BASH_PROFILE.bak"
fi
ln -s "$CURDIR/$OS/bash_profile" "$BASH_PROFILE"


echo $GIT_PROFILE

# symlink .gitconfig
if [ -f $GIT_PROFILE ]; then
  mv "$GIT_PROFILE" "$GIT_PROFILE.bak"
fi
ln -s "$CURDIR/$ARCH/gitconfig" "$GIT_PROFILE"
