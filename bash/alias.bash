#vim: ft=bash

alias tlmgr="${TEXMFDIST}/scripts/texlive/tlmgr.pl --usermode"
alias chtsh="~/.dotfiles/scripts/cht.sh"
alias get_pass="~/.dotfiles/scripts/get_pass.sh"
alias toggle_wifi="~/.dotfiles/scripts/toggle_wifi.sh"

if [[ -f /usr/bin/doas ]]; then alias sudo="doas"; fi
if [[ -f /usr/bin/exa ]]; then
    alias ls="exa --icons" 
    alias la="exa -lah --icons"
    alias ll="exa -lh --icons"
    alias l="exa -lh --icons"
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
