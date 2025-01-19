#!/bin/env bash

# Create vim .swp file locations
mkdir -p ~/.vim/{backup_files,swap_files,undo_files}

# Copy config files
cp ../.gitconfig ~
cp ../.vimrc ~

# Debian based
yes Y | apt install vim
apt install gnome-tweaks npm

# Install Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mkdir -p ~/bin
mv nvim.appimage ~/bin/nvim
echo "alias nvim=~/bin/nvim" >> ~/.bashrc
source ~/.bashrc

# Install Neovim config from my fork
git clone https://github.com/trison/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

