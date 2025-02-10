#!/usr/bin/env bash

TGIM_SESSION_NAME=tgim

if [[ $1 == "start" ]]; then
  tmux new-session -d -s $TGIM_SESSION_NAME 'cd ~/ws/tgim && npm run client:dev';
  tmux split-window;
  tmux send 'cd ~/ws/tgim && npm run server:dev' ENTER;
  tmux a;
elif [[ $1 == "stop" ]]; then
  tmux kill-session -t $TGIM_SESSION_NAME
else
  echo "Invalid argument supplied"
fi
