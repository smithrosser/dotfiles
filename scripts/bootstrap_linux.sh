#!/usr/bin/env bash
echo "==============================================================="
echo " Tom's Bootstrapping Script"
echo " Linux version"
echo "==============================================================="

# Elevate to sudo
if [ "$EUID" -ne 0 ]
then
    exec sudo -s "$0" "$@"
fi

echo "Updating installed packages..."
apt update
apt upgrade

echo "Installing essential packages..."
apt install \
  build-essential \
  git \
  cmake \
  ninja-build \
  zsh \
  ranger \
  curl \
  tmux \
  stow \
  python3 \
  python3_venv \
  python3_virtualenv \
  python3_pip \
  pipx \

echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Installing Golang..."
pushd ~/Downloads 
wget https://go.dev/dl/go1.22.4.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.4.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
popd

echo "Installing conan..."
pipx ensurepath
pipx install conan
  
echo "Creating workspace dirs..."
mkdir -p \
  ~/ws \
  ~/ws/cpp \
  ~/ws/py \
  ~/ws/rs \
  ~/ws/go \

echo "Building/installing Neovim (0.10)..."
pushd ~/ws/cpp 
git clone -b release/0.10 https://github.com/neovim/neovim
pushd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
make install
popd
popd

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

echo "Installing TPM for tmux..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Symlinking config files..."
pushd ..
stow .
popd

echo "Done."

