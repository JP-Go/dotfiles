#!/bin/bash

selected=$(find ~/Fis-21-2/ ~/code/ ~/.dotfiles ~/Documentos -type d -not -wholename "*/.*" | fzf)

if [[ $selected != "" ]]; then
   cd $selected 
fi
