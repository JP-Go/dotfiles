#!/bin/bash

selected=$(find ~ -type d -not -wholename "*/.*" | fzf)

if [[ $selected != "" ]]; then
   cd $selected 
fi
