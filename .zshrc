# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/history
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
setopt autocd extendedglob
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

## Prompt and VCS information
autoload -Uz vcs_info # enable vcs_info
precmd_vcs_info() { vcs_info } # always load before displaying the prompt
precmd_functions+=( precmd_vcs_info )

# add a function to check for untracked files in the directory.
# from https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
# 
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats '%F{blue}%s(%F{red}%m%u%c %F{yellow}%F{green}%b%F{blue})%f ' # git(main)
setopt prompt_subst
# Set Prompt
PROMPT='%B%F{magenta}%3~ %f%b${vcs_info_msg_0_}$ ' 
RPROMPT='%B%(?.%F{green} %?%f.%F{red} %?%f)%b' 

## Other files
source ~/.config/bash/exports
source ~/.config/bash/alias
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=(/usr/share/zsh/site-functions $fpath)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias luamake=/home/jp/Builds/lua-language-server/3rd/luamake/luamake
