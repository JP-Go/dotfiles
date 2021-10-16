#!/bin/bash
code_folders=`echo ~/code/*/**/ ~/code/* | tr ' ' '\n'`
dotfiles=`echo ~/.dotfiles ~/.dotfiles/*/| tr ' ' '\n'`
configs=`echo ~/.config/* ~/config/*/**/ | tr ' ' '\n'`
work_folders=`echo ~/Fis-21-2/*/**/ ~/Fis-21-2/*/ ~/Documentos/*/**/ ~/Documentos/ ~/Estagio-II ~/Estagio-II/* |tr ' ' '\n'`

selected=`printf "$code_folders\n$dotfiles\n$configs\n$work_folders" | fzf`

if [[ $selected != "" ]]; then
    cd $selected
fi
