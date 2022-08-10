#!/bin/bash

selected=$(fd . /home/jp/ /home/jp/.config/nvim /home/jp/.dotfiles -t d -t l -E node_modules -E .git --color never | fzf)

if [[ $selected != "" ]]; then
   cd $selected 
fi
