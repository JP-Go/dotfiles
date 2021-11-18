#!/bin/bash

selected=$(fd . /home/jp/ -t d -t l | fzf)

if [[ $selected != "" ]]; then
   cd $selected 
fi
