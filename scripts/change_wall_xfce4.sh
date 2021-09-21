#!/bin/bash

# Requirements: fzf,ls or exa.
# Change the direcyoty to the directory your wallpapers live
selected=`find ~/Imagens/wallpapers/* | fzf`
# Change this to the property name. To this property, run 
# `xfconf-query -c xfce4-desktop -m` and change the wallpaper 
# once
property="/backdrop/screen0/monitoreDP-1/workspace0/last-image"

if [[ $selected != "" ]]; then
    xfconf-query -c xfce4-desktop -p $property -s $selected
fi
