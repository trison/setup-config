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
mkdir -p /opt/nvim
mv nvim.appimage /opt/nvim/nvim
export PATH="$PATH:/opt/nvim/"

# Install Neovim config from my fork
git clone https://github.com/trison/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

