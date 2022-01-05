#!/bin/sh

if [ $# -lt 1 ]; then
    echo "[ERROR] no package manager provided"
    echo "Usage: ./get_programs.sh <package_manager>"
    exit 1
fi

PACMAN=$1
PACKS=""

add_to_packs(){
    PACKS="$PACKS $1"
}

ask_for_option(){
    local opt=$1
    local len=$(( $# - 2))
    echo "Which $1 would you like to use ($2 is the default)"
    for VAR in $@[@]:1:$(( $len - 3 ))
    do
        echo "$VAR"
    done
    
}

ask_for_option a b c d

# TE=0
# echo -e "Which terminal do you want?(default is alacritty) \n  0: alacritty\n  1: kitty"
# echo "Choice: "
# read -r TE
# 
# 
# if [ "$TE" == '' ] || [ $TE == 0 ]; then
#     add_to_packs "alacritty"
#     echo "Chose alacritty"
# fi
# 
# if [[ $TE == 1 ]]; then
#     add_to_packs "kitty"
#     echo "Chose kitty"
# fi
# 
# echo $PACKS
# echo "$PACMAN"
