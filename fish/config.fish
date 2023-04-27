if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Variables
set EDITOR nvim
set VISUAL nvim
export EDITOR
export VISUAL

set TEXMFDIST /usr/share/texlive/texmf-dist
set TEXMFLOCAL /usr/share/texlive/texmf-local:/usr/share/texmf
set TEXMFSYSVAR /var/lib/texmf
set TEXMFSYSCONFIG /etc/texlive/
set TEXMFHOME ~/texmf
set TEXMFVAR ~/.texlive/texmf-var
set TEXMFCONFIG ~/.texlive/texmf-config

set PATH $PATH /home/jp/.cargo/bin
set PATH $PATH $HOME/.cargo/env

# Abbreviations

abbr vim nvim
abbr lg lazygit
abbr ga git add
abbr gc git commit
abbr gd git diff
abbr gs git status
abbr gp git push

if test -f /usr/bin/btop
    alias htop btop
end

if test -f ~/.sdkman/bin/sdkman-init.sh
    bash ~/.sdkman/bin/sdkman-init.sh
end
