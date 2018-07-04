#!/bin/bash
# old script: for d in ~/.vim/bundle/*; do basename "$d:" && cd "$d" && git pull; done

MESG=`"updated plugins on" date "+%Y%m%d-%H%M%S"`

cd $HOME/.vim

git submodule foreach git pull

git add .

git commit -m "$MESG"

git push origin master
