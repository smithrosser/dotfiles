#!/bin/bash

# copy updated files to repo folder
cp ~/.config/nvim/init.vim .
cp ~/.tmux.conf tmux.conf 
cp ~/.config/alacritty/alacritty.yml .

# add copied files to git repo
git add -A
