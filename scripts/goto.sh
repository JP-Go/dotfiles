#!/bin/bash

selected=$(fd . /home/jp/ -t d -t l --color never --hidden | fzf)

if [[ $selected != "" ]]; then
   cd $selected 
fi
