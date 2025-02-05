#!/bin/env bash

# Create vim .swp file locations
mkdir -p ~/.vim/{backup_files,swap_files,undo_files}

# Copy config files
cp ../.gitconfig ~
cp ../.vimrc ~

# Debian based
yes Y | sudo apt install vim
yes Y | sudo apt install gnome-tweaks npm
yes Y | sudo apt install gparted

# Node version manager (in order to install latest node)
wget https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh
chmod u+x install.sh
./install.sh
source ~/.bashrc
rm install.sh
nvm install "lts/*" --reinstall-packages-from="$(nvm current)"

# Install Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mkdir -p ~/bin
mv nvim.appimage ~/bin/nvim
echo "alias nvim=~/bin/nvim" >> ~/.bashrc
source ~/.bashrc

# Install Neovim config from my fork
git clone https://github.com/trison/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

