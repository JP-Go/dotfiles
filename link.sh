#!/bin/sh
# Link: Create symbolic links from the git repo dir to the
# respective config file.
set -x

PWD=`pwd`

# Basic workflow packages
ln -sf $PWD/alacritty ~/.config/
ln -sf $PWD/kitty ~/.config/
ln -sf  $PWD/.gitconfig ~/.gitconfig
ln -sf $PWD/starship.toml ~/.config/starship.toml
ln -sf $PWD/wallpapers ~/Imagens/

ln -sf $PWD/stylua.toml ~/.config/stylua.toml

if [[ -f /usr/bin/bspwm ]];then 
  if ! [[ -d ~/.config/bspwm/ ]];then mkdir -p ~/.config/bspwm; fi
  if ! [[ -d ~/.config/sxhkd/ ]];then mkdir -p ~/.config/sxhkd; fi
  ln -sf $PWD/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
  ln -sf $PWD/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
fi

if [[ -f /usr/bin/polybar ]];then 
	ln -sf $PWD/polybar ~/.config/
fi

# Config files for bash since most Linux systems use it
if [[ $(printenv SHELL | grep "bash") ]]; then
	mkdir -p ~/.config/bash
	ln -sf $PWD/bash/.bashrc ~/.bashrc
	ln -sf $PWD/bash/alias.bash ~/.config/bash/alias.bash
	ln -sf $PWD/bash/exports.bash ~/.config/bash/exports.bash
	ln -sf $PWD/bash/completions-himalaya.bash ~/.config/bash/completions-himalaya.bash
fi

if [[ $(printenv SHELL | grep "zsh") ]]; then
	mkdir -p ~/.config/zsh/
	ln -sf $PWD/zsh/zshrc ~/.zshrc
	ln -sf $PWD/zsh/aliases.zsh		~/.config/zsh/aliases.zsh
	ln -sf $PWD/zsh/exports.zsh		~/.config/zsh/exports.zsh
	ln -sf $PWD/zsh/functions.zsh	~/.config/zsh/functions.zsh
	ln -sf $PWD/zsh/prompt.zsh		~/.config/zsh/prompt.zsh
	ln -sf $PWD/zsh/vim-mode.zsh	~/.config/zsh/vim-mode.zsh
fi

if [[ -f /usr/bin/i3 ]]; then
	mkdir -p ~/.config/i3/
	ln -sf $PWD/i3/config			~/.config/i3/config
	ln -sf $PWD/i3/config.keycodes  ~/.config/i3/config.keycodes
	ln -sf $PWD/i3/i3status.conf    ~/.config/i3/i3status.conf
fi

ln -sf $PWD/rofi ~/.config/
ln -sf $PWD/helix ~/.config/