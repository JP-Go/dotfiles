# vim: ft=bash

# Set nvim as the default terminal editor
EDITOR=nvim
VISUAL=nvim
export EDITOR;
export VISUAL;

# Configure TeX enviroment variables
export TEXMFDIST=/usr/share/texlive/texmf-dist
export TEXMFLOCAL=/usr/share/texlive/texmf-local:/usr/share/texmf
export TEXMFSYSVAR=/var/lib/texmf
export TEXMFSYSCONFIG=/etc/texlive/
export TEXMFHOME=~/texmf
export TEXMFVAR=~/.texlive/texmf-var
export TEXMFCONFIG=~/.texlive/texmf-config

PATH=${PATH}:${HOME}/.local/bin
