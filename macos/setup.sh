#!/bin/bash

# Copy config files
cp ../.gitconfig ~
cp ../.vimrc ~

# Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew instal node
brew install rar

# XCode command line tools
xcode-select --install
