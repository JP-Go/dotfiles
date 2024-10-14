#vim: ft=bash
#

if [[ -f ~/.local/bin/lvim ]]; then
	alias vim="lvim"
	alias v="lvim"
else 
	alias vim="nvim"
	alias v="nvim"
fi

alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gs="git status"
alias gp="git push"

if [[ -f /usr/bin/lazygit ]]; then alias lg="lazygit" ; fi
if [[ -f /usr/bin/btop ]]; then alias htop="btop" ; fi

alias pn="pnpm"
alias px="pnpx"

alias tmux="TERM=xterm-256color tmux"

alias ll="ls -l"
alias la="ls -a"

alias cat="bat"
alias grep="rg"
