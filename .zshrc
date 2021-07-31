# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/history
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
setopt autocd extendedglob
unsetopt beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jp/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# My custom prompt
autoload -Uz vcs_info # enable vcs_info
precmd () { vcs_info } # always load before displaying the prompt
zstyle ':vcs_info:git:*' formats '%s(%F{red}%b%f)' # git(main)
zstyle ':vcs_info:*' enable git
setopt prompt_subst
#Set Prompt
PROMPT='%F{blue}❱ %f%B%F{blue}%~%f $vcs_info_msg_0_%F{blue}%#%f %b' # ~ git(branch) %
RPROMPT='%B%(?.%F{green}✓ %?%f.%F{red} %?%f) %b' #[✓|] code

source ~/.config/bash/alias
source ~/.config/bash/exports
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=(/usr/share/zsh/site-functions $fpath)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
