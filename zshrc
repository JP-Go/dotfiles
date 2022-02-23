# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=1000

##  Bindings
# Use general vi keybindings
bindkey -v
# Use delete to delete characters (Because zsh is dumb)
bindkey '\e[3~' delete-char
# C-Backspace to delete a word to the left
bindkey '^H' backward-kill-word
# C-Delete to delete a word to the right
bindkey '^[[3;5~' delete-word
# move back a word with C-left
bindkey '^[[1;5D' vi-backward-blank-word
# move forward a word with C-right
bindkey '^[[1;5C' vi-forward-blank-word

## General options
# Cd automatically when typing a dir
# and extend globs
setopt extendedglob
# DO NOT BEEP ON ME
unsetopt beep

## Completion engine
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jp/.zshrc'
autoload -Uz compinit
# Show selection in autocomplete
zstyle ':completion:*' menu select
# Show hidden files in completion options
_comp_options+=(globdots)
compinit
# End of lines added by compinstall

## Other files
source ~/.config/bash/exports
source ~/.config/bash/alias
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

alias luamake=/home/jp/Builds/lua-language-server/3rd/luamake/luamake

. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# eval "$(starship init zsh)"
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
