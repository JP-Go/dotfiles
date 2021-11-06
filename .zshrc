# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/history
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
bindkey '\e[3~' delete-char
bindkey '' backward-kill-word
setopt autocd extendedglob
unsetopt beep

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jp/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -Uz vcs_info # enable vcs_info
precmd () { vcs_info } # always load before displaying the prompt
zstyle ':vcs_info:*' formats '%F{blue}%s(%F{green}%b%F{blue})%f ' # git(main)
setopt prompt_subst

#Set Prompt
PROMPT='%B%F{magenta}%3~ %f%b${vcs_info_msg_0_}' 
RPROMPT='%B%(?.%F{green} %?%f.%F{red} %?%f)%b'

source ~/.config/bash/exports
source ~/.config/bash/alias
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=(/usr/share/zsh/site-functions $fpath)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
