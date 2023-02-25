#vim: ft=bash
#
alias vim="nvim"
alias v="nvim"

alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gs="git status"
alias gp="git push"

if [[ -f /usr/bin/lazygit ]]; then alias lg="lazygit" ; fi
if [[ -f /usr/bin/btop ]]; then alias htop="btop" ; fi

alias pn="pnpm"
alias px="pnpx"
