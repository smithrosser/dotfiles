#!/bin/bash

# copy updated files to repo folder
cp ~/.config/nvim/init.vim .

# add copied files to git repo
git add -A
