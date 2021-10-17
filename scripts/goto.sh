#!/bin/bash
code_folders=`echo ~/code`
dotfiles=`echo ~/.dotfiles`
configs=`echo ~/.config/nvim `
work_folders=`echo ~/Fis-21-2 ~/Documentos ~/Estagio-II`

selected=`find $code_folders $dotfiles $configs $work_folders -type d -not -wholename "*/.git*"| fzf`

if [[ $selected != "" ]]; then
   cd $selected 
fi
