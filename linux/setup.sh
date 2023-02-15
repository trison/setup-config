#!/bin/bash

# Copy config files
cp ../.gitconfig ~
cp ../.vimrc ~

# Debian based
yes Y | apt install vim
apt install gnome-tweaks npm
