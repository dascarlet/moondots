#!/bin/bash

for f in .??*
do
  [ "$f" = ".git" ] && continue

  ln -snfv ./moondots/"$f" $HOME/"$f"
done
