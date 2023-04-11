#!/bin/sh
# Link: Create symbolic links from the git repo dir to the
# respective config file.
set -x

PWD=$(pwd)

# Basic workflow packages
ln -sf $PWD/alacritty ~/.config/
ln -sf $PWD/kitty ~/.config/
ln -sf $PWD/.gitconfig ~/.gitconfig
ln -sf $PWD/starship.toml ~/.config/starship.toml
ln -sf $PWD/wallpapers ~/Imagens/
ln -sf $PWD/stylua.toml ~/.config/stylua.toml
ln -sf $PWD/i3 ~/.config/
ln -sf $PWD/helix ~/.config/
ln -sf $PWD/bash/.bashrc ~/.bashrc
ln -sf $PWD/bash ~/.config/
