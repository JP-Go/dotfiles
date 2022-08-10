HISTSIZE=1000000
SAVEHIST=1000000

export MANPAGER='nvim +Man!'
export MANWIDTH=999

# Configure TeX enviroment variables
export TEXMFDIST=/usr/share/texmf-dist
export TEXMFLOCAL=/usr/share/texmf-local:/usr/share/texmf
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
if [[ -d $HOME/.yarn/bin ]]; then PATH=$PATH:$HOME/.yarn/bin;fi
if [[ -d $HOME/.npm/bin ]]; then PATH=$PATH:$HOME/.npm/bin;fi
if [[ -d $HOME/.local/bin ]]; then PATH=$PATH:$HOME/.local/bin;fi
export PATH
# Add some perl env variables
PERL5LIB="/home/jp/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/jp/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/jp/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/jp/perl5"; export PERL_MM_OPT;

# Go path
export PATH=$PATH:/home/jp/.go/bin
