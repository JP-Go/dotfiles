# vim: ft=bash

# Set nvim as the default terminal editor
EDITOR=nvim
VISUAL=nvim
export EDITOR;
export VISUAL;

# Configure TeX enviroment variables
export TEXMFDIST=/usr/share/texlive/texmf-dist
export TEXMFLOCAL=/usr/share/texlive/texmf-local:/usr/share/texmf
export TEXMFSYSVAR=/var/lib/texmf
export TEXMFSYSCONFIG=/etc/texlive/
export TEXMFHOME=~/texmf
export TEXMFVAR=~/.texlive/texmf-var
export TEXMFCONFIG=~/.texlive/texmf-config

# Add perl scripts, ruby gems and cargo packages(rust) to PATH
PATH=$PATH:/home/jp/.cargo/bin:/home/jp/.local/share/gem/ruby/3.0.0/bin
PATH="/home/jp/perl5/bin${PATH:+:${PATH}}"; 
if [[ -f $HOME/.cargo/env ]]; then . "$HOME/.cargo/env";fi
# Add yarn or npm downloaded binaries to path
if [[ -d $HOME/.local/bin ]]; then PATH="$PATH:$HOME/.local/bin";fi
# Add some perl env variables
PERL5LIB="/home/jp/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/jp/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/jp/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/jp/perl5"; export PERL_MM_OPT;

# Add C libs in usr/local/lib
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib
export NNN_TMPFILE=${HOME}/.config/nnn/.lastd

PATH=${PATH}:${HOME}/.local/bin
export ANDROID_HOME=~/Android/Sdk
PATH=$PATH:$ANDROID_HOME/emulator
PATH=$PATH:$ANDROID_HOME/tools
PATH=$PATH:$ANDROID_HOME/tools/bin
PATH=$PATH:$ANDROID_HOME/platform-tools
PATH=$PATH:$ANDROID_HOME/../android-studio/bin

PATH=$PATH:${HOME}/.local/share/nvim/mason/bin/; export PATH
