#!/usr/bin/env bash

UBUNTU_VERSION="24.04"

echo "Updating..."
sudo apt update
sudo apt upgrade -y

echo "Installing packages..."
sudo apt install -y \
	build-essential \
	git \
	zsh \
	stow \
	curl \
	ripgrep \
	python3-pip \
	python3-venv \
	gnome-tweaks \
	gnome-shell-extensions \
	gnome-browser-connector \
	extrepo

echo "Installing librewolf..."
sudo extrepo enable librewolf
sudo apt update
sudo apt install librewolf

echo "Removing firefox..."
sudo snap remove firefox
sudo apt remove firefox

# Install oh-my-zsh
echo "Installing oh-my-zsh (exit zsh to continue bootstrap)..."
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

echo "Installing ghostty..."
GHOSTTY_PPA_DEB="ghostty_1.1.3-0.ppa2_amd64_${UBUNTU_VERSION}.deb"
wget https://github.com/mkasberg/ghostty-ubuntu/releases/download/1.1.3-0-ppa2/${GHOSTTY_PPA_DEB}
sudo apt install ./${GHOSTTY_PPA_DEB} -y
rm ./${GHOSTTY_PPA_DEB}

echo "Installing neovim..."
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim

echo "Installing rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Installing node & npm (via nvm)..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install --lts

echo "Installing docker..."
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install \
	docker-ce \
	docker-ce-cli \
	containerd.io \
	docker-buildx-plugin \
	docker-compose-plugin

DOCKER_DESKTOP_DEB="docker-desktop-amd64.deb"
wget "https://desktop.docker.com/linux/main/amd64/${DOCKER_DESKTOP_DEB}"
sudo apt install ./${DOCKER_DESKTOP_DEB}
rm ${DOCKER_DESKTOP_DEB}

echo "Installing font-manager"
sudo add-apt-repository ppa:font-manager/staging
sudo apt update
sudo apt install font-manager

echo "Importing configs..."
git clone https://github.com/smithrosser/dotfiles
rm ~/.zshrc
pushd ~/dotfiles
stow nvim ghostty zsh
stow --no-folding code fontconfig
popd

echo "Done!"

