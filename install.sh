#!/bin/sh

echo "Checking for updates..."
sudo apt update
sudo apt upgrade

read -p "Finished updating. Hit Enter to continue -> "

echo "Installing build tools..."
sudo apt install build-essential cmake openocd stlink-tools git zsh curl ranger

read -p "Finished installing build tools. Hit Enter to continue -> "

echo "Installing Neovim, vim-plug and configuring..."
sudo apt install neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
mkdir -p ~/.config/nvim
cp ./init.vim ~/.config/nvim
sudo apt install nodejs npm clangd

read -p "Finished installing Neovim. Hit Enter to continue -> "

echo "Installing snap applications..."
snap install spotify discord mailspring
snap install code --classic

read -p "Finished installing snap applications. Hit Enter to continue -> "

echo "Exporting Alacritty config file..."
mkdir -p ~/.config/alacritty
cp ./alacritty.yml ~/.config/alacritty

echo "Installing Nordic-darker GTK theme..."
mkdir -p ~/.themes/Nordic-darker
sudo tar -xf Nordic-darker.tar.xz -C ~/.themes/Nordic-darker 

echo "Installing SF Mono font..."
git clone https://github.com/supercomputra/SF-Mono-Font.git
sudo mv SF-Mono-Font /usr/share/fonts/SF-Mono
fc-cache -fv

echo "Installing Gnome Tweaks..."
sudo apt install gnome-tweak-tool

read -p "Finished installing theme components. Hit Enter to continue -> "

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Finished!"

echo "Still to do manually: arm-none-eabi, Alacritty, ArcMenu, icons, Teams, VSCode extensions."
