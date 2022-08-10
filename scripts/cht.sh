#!/bin/sh

if [ $# -lt 2 ]; then
    echo "[ERROR] not enough arguments providede"
    echo "Usage: ./cht.sh <lang> <terms>"
    exit 1
fi

curl `echo "cht.sh/$1/$2"`
