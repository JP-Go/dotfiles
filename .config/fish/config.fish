if status is-interactive
    # Commands to run in interactive sessions can go here
end

# VIM mode
set -g fish_key_bindings fish_vi_key_bindings

# Variables

set PATH $PATH $HOME/.cargo/bin
set PATH $PATH $HOME/go/bin
set PATH $PATH $HOME/.cargo/env
set PATH $PATH $HOME/.local/opt/node/bin
set PATH $PATH $HOME/.local/opt/node/bin
set PATH $PATH $HOME/.local/share/pnpm/
set PATH $PATH /usr/local/go/bin
set PATH $PATH /opt/DataGrip/bin/
set -x PATH $PATH $HOME/.local/bin

if type -q nvim
    set EDITOR nvim
end

zoxide init fish | source

# Abbreviations

abbr vim $EDITOR
source $HOME/.config/fish/fish_aliases.fish

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/home/jp/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
