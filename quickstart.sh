#!/bin/bash

tmux new-session -d 'ide'
tmux new-window 'debug'
tmux split-window -h 'processmanager'
tmux split-window -v 'v-getk'
tmux split-window -v 'recorder'
tmux -2 attach-session -d
