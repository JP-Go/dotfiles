#vim: ft=bash

alias tlmgr="${TEXMFDIST}/scripts/texlive/tlmgr.pl --usermode"

if [[ -f /usr/bin/doas ]]; then alias sudo="doas"; fi
if [[ -f /usr/bin/exa ]]; then
    alias l="exa --icons" 
    alias ls="exa --icons" 
    alias la="exa -lhaG --icons"
    alias ll="exa -lhG --icons"
fi

if [[ -f /usr/bin/lsd ]]; then
    alias l="lsd"
    alias ls="lsd"
    alias ll="lsd -l" 
    alias la="lsd -a"
fi

if [[ -f ~/.local/nvim/bin/nvim ]]; then
    alias nvim="~/.local/nvim/bin/nvim"
    alias vim="~/.local/nvim/bin/nvim"
    alias v="~/.local/nvim/bin/nvim"
fi

if [[ -f /usr/bin/nvim ]]; then
    alias vim="/usr/bin/nvim"
    alias v="/usr/bin/nvim"
fi

if [[ -f /usr/bin/gs ]]; then 
    alias gita="git add"
    alias gitc="git commit"
    alias gitd="git diff"
    alias gits="git status"
    alias gitp="git push"
else
    alias ga="git add"
    alias gc="git commit"
    alias gd="git diff"
    alias gs="git status"
    alias gp="git push"
fi

if [[ -f /usr/bin/lazygit ]]; then alias lg="lazygit" ; fi
if [[ -f /usr/bin/btop ]]; then alias htop="btop" ; fi
