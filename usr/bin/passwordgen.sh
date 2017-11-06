#!/bin/sh

chars="~!@#$%^*_=+A-Za-z0-9"
length=8
number=1

while getopts al:n:? opt; do
  case $opt in
    a)
      chars="A-Za-z0-9"
      ;;
    l)
      length=$OPTARG
      ;;
    n)
      number=$OPTARG
      ;;
    ?)
      printf "Usage: %s: [-a] [-l length] [-n number]\n" $(basename $0)
      exit
      ;;
  esac
done

for i in `seq $number`; do
  echo `< /dev/random LC_CTYPE=C tr -dc $chars | head -c$length`
done
