#!/bin/bash

# Create vim .swp file locations
mkdir -p ~/.vim/{backup_files,swap_files,undo_files}

# Copy config files
cp ../.gitconfig ~
cp ../.vimrc ~

# Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew install node
brew install rar
brew install blackhole-2ch
brew install --cask visual-studio-code
brew install neovim
brew install ripgrep

# Neovim config from my fork
git clone https://github.com/trison/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

npm install -g nodemon

# XCode command line tools
xcode-select --install
