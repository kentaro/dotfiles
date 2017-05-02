#!/bin/bash

for p in `ls -A`; do
  if [ $p != "setup.sh" ] && [ $p != ".git" ] && ! `echo "$p" | grep -sqE ".swp$"`; then

    # .configは既存のものもあるので置き換えない
    if [ $p == ".config" ]; then
      for c in `ls -A $p/`; do
        src="`pwd`/$p/$c"
        dst="$HOME/$p/$c"
        rm -f "$dst"
        ln -sf "$src" "$dst" && echo "link: $dst to $src"
      done

    # その他のものはそのままリンクする
    else
      src="`pwd`/$p"
      dst="$HOME/$p"
      rm -f "$dst"
      ln -sf "$src" "$dst" && echo "link: $dst to $src"
    fi
  fi
done
