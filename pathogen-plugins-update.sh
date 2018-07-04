#!/bin/bash

# update my pathogen plugins

for d in ~/.vim/bundle/*; do basename "$d:" && cd "$d" && git pull; done
