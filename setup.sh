#!/bin/sh
# NOTE: this script _must_ be executed with the $PWD being the directory
# that this script lives in so that all the links are properly created.

link=false
unlink=false

while getopts lu? opt; do
  case $opt in
    l) link=true ;;
    u) unlink=true ;;
    ?)
      printf "Usage: %s: [-l | -u]\n" $(basename $0)
      exit
      ;;
  esac
done

if [ "$link" = true ] && [ "$unlink" = true ]; then
  echo "ERROR: Cannot both link and unlink files at the same time."
  exit
fi

if [ "$link" = false ] && [ "$unlink" = false ]; then
  echo "ERROR: Must chose either to link or unlink files."
  exit
fi

. ./files.sh

if [ "$link" = true ]; then
  _pwd=$PWD
  cd $HOME

  for f in $files; do
    source="$_pwd/$f"
    target="$HOME/.$f"

    # NOTE: this will overwrite any existing file/directory
    if [ -e "$target" ]; then
      rm -rf "$target"
    fi
    ln -s "$source" "$target"
  done
  printf "Linked all dotfiles -$files\n"
fi

if [ "$unlink" = true ]; then
  for f in $files; do
    target="$HOME/.$f"
    if [ -h "$target" ]; then
      rm "$target"
    fi
  done
  printf "Unlinked all dotfiles -$files\n"
fi
