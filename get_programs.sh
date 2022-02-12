#!/bin/sh

if [ $# -lt 1 ]; then
    echo "[ERROR] no package manager provided"
    echo "Usage: ./get_programs.sh <package_manager>"
    exit 1
fi

PACMAN=$1
PACKS=""

add_to_packs () {
    PACKS="$PACKS $1"
}

ask_for_option () {
    local len=$(($# - 1))
    local options=("$@")
    echo $1
    for i in $(seq 1 $len)
    do
      echo "$((i - 1)): ${options[$i]}"
    done
}

read_option () {
  while [[ 1 ]]; do
    local choice=1
    local options=("$@")
    echo "Choice: "
    read -r choice
    if ! [[ $choice ]]; then 
      choice=0
    fi
    local program=${options[$choice]}
    if [[ $program ]] && [[ $choice =~ [0-9] ]]; then
      echo "Chose $program"
      add_to_packs "${program}"
      break
    else
      echo "[ERROR] invalid option"
    fi
  done

}

ask_for_option "Choose your prefered terminal emulator (alacritty is the default)" alacritty kitty
read_option alacritty kitty

echo $PACKS
