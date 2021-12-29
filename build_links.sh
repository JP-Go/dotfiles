#!/bin/sh

PWD=`pwd`

mkdir -p ~/.config/alacritty
ln -s $PWD/alacritty.yml ~/.config/alacritty.yml
ln -s $PWD/colors.yml ~/.config/colors.yml

mkdir -p ~/.config/bash
ln -sf $PWD/bash/.bashrc ~/.bashrc
ln -sf $PWD/bash/alias ~/.config/bash/alias
ln -sf $PWD/bash/exports ~/.config/bash/exports


ln -sf $PWD/stylua.toml ~/.config/stylua.toml
ln -s $PWD/.gitconfig ~/.gitconfig
