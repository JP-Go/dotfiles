#!/bin/bash

selected=$(fd . /home/jp/ -t d -t l --color never| fzf)

if [[ $selected != "" ]]; then
   cd $selected 
fi
