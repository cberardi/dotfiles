#!/bin/sh

# generate an array of files to be (un)linked
files=
files=$files+cshrc
files=$files+exrc
files=$files+gitignore
files=$files+tmux.conf
files=$files+usr
files=$files+vim
files=$files+vimrc

# NOTE: need to break up file list into a space separated list
# there is probably a better way to do this
files=`printf $files | sed -e 's/+/ /g'`
