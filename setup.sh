#!/bin/bash

for p in `ls -d .[^.]*`; do
  if [ $p != ".git" ] && ! `echo "$p" | grep -sqE ".swp$"`; then
    ln -sf "`pwd`/$p" "$HOME/$p" && echo "link: $HOME/$p to `pwd`/$p"
  fi
done
