#!/bin/sh

# Subversion
# ???

# Git
if hash git 2> /dev/null; then
  gitinfo=`git branch 2> /dev/null | grep . | awk '{ printf $2 }' | xargs`
  if [ ! -z "$gitinfo" ]; then
    echo "(git)-[$gitinfo]"
    exit
  fi
fi

# Mercurial
#if hash hg 2> /dev/null; then
#  hginfo=`hg branch 2> /dev/null | grep . | awk '{ printf $0 }' | xargs`
#  if [ ! -z "$hginfo" ]; then
#    echo "(hg)-[$hginfo]"
#    exit
#  fi
#fi

# Fossil
#if hash fossil 2> /dev/null; then
#  fossilinfo=`fossil branch 2> /dev/null | grep . | awk '{ printf $2 }' | xargs`
#  if [ ! -z "$fossilinfo" ]; then
#    echo "(fossil)-[$fossilinfo]"
#    exit
#  fi
#fi
