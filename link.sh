#!/bin/sh
# Link: Create symbolic links from the git repo dir to the
# respective config file.

PWD=`pwd`

# Config files for bash since most Linux systems use it
mkdir -p ~/.config/bash
ln -sf $PWD/bash/.bashrc ~/.bashrc
ln -sf $PWD/bash/alias ~/.config/bash/alias
ln -sf $PWD/bash/exports ~/.config/bash/exports

# Alacritty config if it's installed
if [[ -f /usr/bin/alacritty ]]; then
    if ! [[ -d ~/.config/alacritty/ ]];then mkdir -p ~/.config/alacritty; fi
    ln -s $PWD/alacritty.yml ~/.config/alacritty/alacritty.yml
    ln -s $PWD/colors.yml ~/.config/alacritty/colors.yml
fi

# Zsh config
if [[ -f /usr/bin/zsh ]];then 
    ln -sf $PWD/.zshrc ~/.zshrc
fi

ln -sf $PWD/stylua.toml ~/.config/stylua.toml
ln -s $PWD/.gitconfig ~/.gitconfig
