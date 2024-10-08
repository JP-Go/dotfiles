if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Variables

set PATH $PATH $HOME/.cargo/bin
set PATH $PATH $HOME/go/bin
set PATH $PATH $HOME/.cargo/env
set PATH $PATH $HOME/.local/bin


# Abbreviations

abbr vim $EDITOR
abbr lg lazygit
abbr ga git add --patch
abbr gc git commit
abbr gd git diff
abbr gs git status
abbr gp git push

if test -f ~/.config/envman/load.sh
    bash ~/.config/envman/load.sh
end
