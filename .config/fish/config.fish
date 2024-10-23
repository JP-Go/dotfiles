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
set -x PATH $PATH $HOME/.local/bin

if type -q nvim
    set EDITOR nvim
end

zoxide init fish | source

# Abbreviations

abbr vim $EDITOR
abbr lg lazygit
abbr ga git add --patch
abbr gc git commit
abbr gd git diff
abbr gs git status
abbr gp git push
