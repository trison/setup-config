#!/bin/env bash

# Create vim .swp file locations
mkdir -p ~/.vim/{backup_files,swap_files,undo_files}

# Copy config files
cp ../.gitconfig ~
cp ../.vimrc ~

# Debian based
yes Y | apt install vim
apt install gnome-tweaks npm
