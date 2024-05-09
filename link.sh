#!/bin/bash

DOTFILES_DIR=$(pwd)

pushd ~/.config

echo "Linking Neovim config..."
if [ -d ~/.config/nvim ]; then
  echo "Directory/link exists, deleting..."
  rm -rf ~/.config/nvim
fi
ln -s $DOTFILES_DIR/nvim

popd

pushd ~

echo "Linking .zshrc..."
if [ -d ~/.zshrc ]; then
  rm .zshrc
fi
ln -sf $DOTFILES_DIR/zshrc .zshrc

echo "Linking .wezterm.lua..."
if [ -d ~/.wezterm.lua ]; then
  rm .wezterm.lua
fi
ln -sf $DOTFILES_DIR/wezterm.lua .wezterm.lua

echo "Linking .tmux.conf..."
if [ -d ~/.tmux.conf ]; then
  rm .wezterm.lua
fi
ln -sf $DOTFILES_DIR/tmux.conf .tmux.conf

popd

echo Done
