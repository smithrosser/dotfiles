#!/bin/bash

# copy updated files to repo folder
cp ~/.config/nvim/init.vim .
cp ~/.tmux.conf :wq
cp ~/.config/gtk-3.0/gtk.css .

# add copied files to git repo
git add -A
