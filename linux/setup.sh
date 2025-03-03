#!/bin/env bash

using_gnome=1

if [[ "$DESKTOP_SESSION" == "gnome" ]]; then
   using_gnome=0
fi

# Create vim .swp file locations
mkdir -p ~/.vim/{backup_files,swap_files,undo_files}

# Copy config files
cp ../.gitconfig ~
cp ../.vimrc ~

if [ -f "/etc/debian_version" ]; then
	if [[ $is_gnome -eq 0 ]]; then
		yes Y | sudo apt install gnome-tweaks
	fi
	yes Y | sudo apt install npm
	yes Y | sudo apt install vim
	yes Y | sudo apt install gparted
	yes Y | sudo apt install vlc
fi

# Node version manager (in order to install latest node)
wget https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh
chmod u+x install.sh
./install.sh
source ~/.bashrc
rm install.sh
nvm install "lts/*" --reinstall-packages-from="$(nvm current)"

# Install Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
mkdir -p ~/bin
mv nvim-linux-x86_64.appimage ~/bin/nvim
echo "alias nvim=~/bin/nvim" >> ~/.bashrc
source ~/.bashrc

# Install Neovim config from my fork
git clone https://github.com/trison/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

