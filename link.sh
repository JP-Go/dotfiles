#!/bin/sh
# Link: Create symbolic links from the git repo dir to the
# respective config file.
set -x

PWD=`pwd`

# Config files for bash since most Linux systems use it
mkdir -p ~/.config/bash
ln -sf $PWD/bash/.bashrc ~/.bashrc
ln -sf $PWD/bash/alias ~/.config/bash/alias
ln -sf $PWD/bash/exports ~/.config/bash/exports

# Alacritty config if it's installed
if [[ -f /usr/bin/alacritty ]]; then
    if ! [[ -d ~/.config/alacritty/ ]];then mkdir -p ~/.config/alacritty; fi
    ln -s $PWD/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
    ln -s $PWD/alacritty/colors.yml ~/.config/alacritty/colors.yml
fi

# Zsh config
if [[ -f /usr/bin/zsh ]];then 
    ln -sf $PWD/zshrc ~/.zshrc
fi

if [[ -f /usr/bin/kitty ]];then 
    if ! [[ -d ~/.config/kitty/ ]];then mkdir -p ~/.config/kitty; fi
    ln -s $PWD/kitty/kitty.conf ~/.config/kitty/kitty.conf
    ln -s $PWD/kitty/duskfox.conf ~/.config/kitty/duskfox.conf
    ln -s $PWD/kitty/dracula.conf ~/.config/kitty/dracula.conf
fi

ln -sf $PWD/stylua.toml ~/.config/stylua.toml
ln -s  $PWD/.gitconfig ~/.gitconfig

if [[ -f /usr/bin/bspwm ]];then 
  if ! [[ -d ~/.config/bspwm/ ]];then mkdir -p ~/.config/bspwm; fi
  if ! [[ -d ~/.config/sxhkd/ ]];then mkdir -p ~/.config/sxhkd; fi
  ln -sf $PWD/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
  ln -sf $PWD/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
fi

if [[ -f /usr/bin/polybar ]];then 
  if ! [[ -d ~/.config/polybar/ ]];then mkdir -p ~/.config/polybar; fi
  ln -sf $PWD/polybar/config ~/.config/polybar/config
  ln -sf $PWD/polybar/launch.sh ~/.config/polybar/launch.sh
fi
