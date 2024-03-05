# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Alias

[[ -f $(which lazygit) ]] && alias lg=$(which lazygit)
alias vim="nvim"
alias v="nvim"

# Set nvim as the default terminal editor
EDITOR=nvim
VISUAL=nvim
export EDITOR;
export VISUAL;

PATH=$PATH:/home/jp/.cargo/bin:/home/jp/.local/share/gem/ruby/3.0.0/bin
if [[ -d $HOME/.local/bin ]]; then PATH="$PATH:$HOME/.local/bin";fi

PATH=${PATH}:${HOME}/.local/bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Turso
PATH="/home/jp/.turso:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
PATH=$BUN_INSTALL/bin:$PATH
export VOLTA_HOME="$HOME/.volta"
PATH=$VOLTA_HOME/bin:$PATH
export PATH=$BUN_INSTALL/bin:$PATH

eval "$(zoxide init zsh)"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
