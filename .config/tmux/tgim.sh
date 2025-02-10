#!/usr/bin/env bash

TGIM_DIR="~/ws/tgim"
TGIM_SESSION_NAME="tgim"

if [[ $1 == "start" ]]; then
  tmux new-session -d -s $TGIM_SESSION_NAME -x $(tput cols) -y $(tput lines) "cd $TGIM_DIR && nvim";
  tmux split-window -h -p 20;
  tmux send "cd $TGIM_DIR && npm run client:dev" ENTER;
  tmux split-window -v;
  tmux send "cd $TGIM_DIR && npm run server:dev" ENTER;
  tmux a -t $TGIM_SESSION_NAME:0.0;
elif [[ $1 == "stop" ]]; then
  tmux kill-session -t $TGIM_SESSION_NAME
else
  echo "Bad argument (valid: 'start', 'stop')"
fi
