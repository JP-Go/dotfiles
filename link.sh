#!/bin/sh
# Link: Create symbolic links from the git repo dir to the
# respective config file.
set -x

PWD=`pwd`

# Config files for bash since most Linux systems use it
mkdir -p ~/.config/bash
ln -sf $PWD/bash/.bashrc ~/.bashrc
ln -sf $PWD/bash/alias.bash ~/.config/bash/alias.bash
ln -sf $PWD/bash/exports.bash ~/.config/bash/exports.bash
ln -sf $PWD/bash/completions-himalaya.bash ~/.config/bash/completions-himalaya.bash

# Basic workflow packages
[[ -f /usr/bin/alacritty ]] && ln -s $PWD/alacritty ~/.config/
[[ -f /usr/bin/zsh ]] && ln -sf $PWD/zshrc ~/.zshrc
[[ -f /usr/bin/kitty ]] && ln -sf $PWD/kitty ~/.config/
[[ -f /usr/bin/git ]] && ln -s  $PWD/.gitconfig ~/.gitconfig

[[ -f /usr/bin/stylua ]] &&  ln -sf $PWD/stylua.toml ~/.config/stylua.toml
[[ -f /usr/bin/starship ]] || [[ -f $HOME/.cargo/bin/starship ]] && ln -sf $PWD/starship.toml ~/.config/starship.toml

if [[ -f /usr/bin/bspwm ]];then 
  if ! [[ -d ~/.config/bspwm/ ]];then mkdir -p ~/.config/bspwm; fi
  if ! [[ -d ~/.config/sxhkd/ ]];then mkdir -p ~/.config/sxhkd; fi
  ln -sf $PWD/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
  ln -sf $PWD/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
fi

if [[ -f /usr/bin/polybar ]];then 
  if ! [[ -d ~/.config/polybar/ ]];then mkdir -p ~/.config/polybar; fi
  ln -sf $PWD/polybar/config.ini ~/.config/polybar/config.ini
  ln -sf $PWD/polybar/launch.sh ~/.config/polybar/launch.sh
fi

if [[ -f /usr/bin/hx ]]; then
  if ! [[ -d ~/.config/helix/ ]];then mkdir -p ~/.config/helix; fi
  ln -sf $PWD/helix/config.toml ~/.config/helix/config.toml
  ln -sf $PWD/helix/languages.toml ~/.config/helix/languages.toml
fi
