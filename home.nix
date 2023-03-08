{ config, pkgs, ... }:
let 
  term_font = "Fira Code Nerd Font";
  term_font_size = "13";
  term_theme = "kanagawa";
  packages = with pkgs; [
    htop
    neovim
    alacritty
    docker
    docker-compose
    chromium
    gcc_multi
    ripgrep
    nodejs
    exa
    tdesktop
    rustup
    rust-analyzer
    opencv
  ];
in 
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jp";
  home.homeDirectory = "/home/jp";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Add starship
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
    };
  };

  programs.go.enable = true;
  
  home.packages = packages;
  home.file = {
  ".config/alacritty/alacritty.yml".text = ''
    import:
      - ~/.config/alacritty/colors.yml
    env:
      TERM: alacritty
    window:
      opacity: 0.90
      dimensions:
        columns: 88
        lines: 24
      padding:
        x: 0
        y: 0
      dynamic_padding: false
      decorations: full
    font:
      normal:
        family: ${term_font}
        style: Regular
      bold:
        family: ${term_font}
        style: Bold
      italic:
        family: ${term_font}
        style: Italic
      bold_italics:
        family: ${term_font}
        style: Bold Italic
      size: ${term_font_size}
      offset:
        x: 0
        y: 0
    cursor:
      style:
        shape: Block
    key_bindings:
      - { key: PageUp, mods: Shift, mode: ~Alt, action: ScrollPageUp }
      - { key: PageDown, mods: Shift, mode: ~Alt, action: ScrollPageDown }
      - { key: Home, mods: Shift, mode: ~Alt, action: ScrollToTop }
      - { key: End, mods: Shift, mode: ~Alt, action: ScrollToBottom }
      - { key: V, mods: Control|Shift, mode: ~Vi, action: Paste }
      - { key: C, mods: Control|Shift, action: Copy }
      - { key: F, mods: Control|Shift, mode: ~Search, action: SearchForward }
      - { key: B, mods: Control|Shift, mode: ~Search, action: SearchBackward }
      - { key: Key0, mods: Control, action: ResetFontSize }
      - { key: Equals, mods: Control, action: IncreaseFontSize }
      - { key: Plus, mods: Control, action: IncreaseFontSize }
      - { key: NumpadAdd, mods: Control, action: IncreaseFontSize }
      - { key: Minus, mods: Control, action: DecreaseFontSize }
      - { key: NumpadSubtract, mods: Control, action: DecreaseFontSize }
      - { key: T, mods: Control|Shift, action: SpawnNewInstance }
    '';
  ".config/alacritty/colors.yml".text = ''
  schemes:
    melange: &melange
      primary:
        foreground: '#ECE1D7'
        background: '#2A2520'
      normal:
        black:   '#352F2A'
        red:     '#B65C60'
        green:   '#78997A'
        yellow:  '#EBC06D'
        blue:    '#9AACCE'
        magenta: '#B380B0'
        cyan:    '#86A3A3'
        white:   '#A38D78'
      bright:
        black:   '#4D453E'
        red:     '#F17C64'
        green:   '#99D59D'
        yellow:  '#EBC06D'
        blue:    '#9AACCE'
        magenta: '#CE9BCB'
        cyan:    '#88B3B2'
        white:   '#C1A78E'
    mellow: &mellow
      # Default colors
      primary:
        background: '#161617'
        foreground: '#c9c7cd'

      # Cursor colors
      cursor:
        text: '#c9c7cd'
        cursor: '#757581'

      # Normal colors
      normal:
        black:   '#27272a'
        red:     '#f5a191'
        green:   '#90b99f'
        yellow:  '#e6b99d'
        blue:    '#aca1cf'
        magenta: '#e29eca'
        cyan:    '#ea83a5'
        white:   '#c1c0d4'

      # Bright colors
      bright:
        black:   '#353539'
        red:     '#ffae9f'
        green:   '#9dc6ac'
        yellow:  '#f0c5a9'
        blue:    '#b9aeda'
        magenta: '#ecaad6'
        cyan:    '#f591b2'
        white:   '#cac9dd'
      draw_bold_text_with_bright_colors: true
    snazzy: &snazzy   
      primary:
        background: '#282a36'
        foreground: '#eff0eb'

      cursor:
        cursor: '#97979b'

      selection:
        text:       '#282a36'
        background: '#feffff'

      normal:
        black:   '#282a36'
        red:     '#ff5c57'
        green:   '#5af78e'
        yellow:  '#f3f99d'
        blue:    '#57c7ff'
        magenta: '#ff6ac1'
        cyan:    '#9aedfe'
        white:   '#f1f1f0'

      bright:
        black:   '#686868'
        red:     '#ff5c57'
        green:   '#5af78e'
        yellow:  '#f3f99d'
        blue:    '#57c7ff'
        magenta: '#ff6ac1'
        cyan:    '#9aedfe'
        white:   '#eff0eb'

    carbonfox: &carbonfox 
      primary:
        background: "0x161616"
        foreground: "0xf2f4f8"
      # Normal colors
      normal:
        black: "0x282828"
        red: "0xee5396"
        green: "0x25be6a"
        yellow: "0x08bdba"
        blue: "0x78a9ff"
        magenta: "0xbe95ff"
        cyan: "0x33b1ff"
        white: "0xdfdfe0"
      # Bright colors
      bright:
        black: "0x484848"
        red: "0xf16da6"
        green: "0x46c880"
        yellow: "0x2dc7c4"
        blue: "0x8cb6ff"
        magenta: "0xc8a5ff"
        cyan: "0x52bdff"
        white: "0xe4e4e5"
      indexed_colors:
        - { index: 16, color: "0x3ddbd9" }
        - { index: 17, color: "0xff7eb6" }
    gruvbox_dark: &gruvbox_dark # Default colors
      primary:
        # hard contrast: background = '0x1d2021'
        background: "0x282828"
        # soft contrast: background = '0x32302f'
        foreground: "0xebdbb2"

      # Normal colors
      normal:
        black: "0x282828"
        red: "0xcc241d"
        green: "0x98971a"
        yellow: "0xd79921"
        blue: "0x458588"
        magenta: "0xb16286"
        cyan: "0x689d6a"
        white: "0xa89984"

      # Bright colors
      bright:
        black: "0x928374"
        red: "0xfb4934"
        green: "0xb8bb26"
        yellow: "0xfabd2f"
        blue: "0x83a598"
        magenta: "0xd3869b"
        cyan: "0x8ec07c"
        white: "0xebdbb2"
    gruvbox_material_hard_dark: &gruvbox_material_hard_dark
      primary:
        background: &gbm_backgound "#1d2021"
        foreground: &gbm_foreground "#d4be98"

      normal:
        black: "#32302f"
        red: "#ea6962"
        green: "#a9b665"
        yellow: "#d8a657"
        blue: "#7daea3"
        magenta: "#d3869b"
        cyan: "#89b482"
        white: "#d4be98"
      bright:
        black: "#32302f"
        red: "#ff3030"
        green: "#8ef580"
        yellow: "#e0af69"
        blue: "#64aebe"
        magenta: "#e278aa"
        cyan: "#8fb096"
        white: "#d4be98"

    monokai_pro: &monokai_pro
      primary:
        background: "#2D2A2E"
        foreground: "#FCFCFA"
      normal:
        black: "#403E41"
        red: "#FF6188"
        green: "#A9DC76"
        yellow: "#FFD866"
        blue: "#FC9867"
        magenta: "#AB9DF2"
        cyan: "#78DCE8"
        white: "#FCFCFA"
      bright:
        black: "#727072"
        red: "#FF6188"
        green: "#A9DC76"
        yellow: "#FFD866"
        blue: "#FC9867"
        magenta: "#AB9DF2"
        cyan: "#78DCE8"
        white: "#FCFCFA"

    onedark: &onedark
      primary:
        background: "0x1e2127"
        foreground: "0xabb2bf"
      # Normal colors
      normal:
        black: "0x1e2127"
        red: "0xe06c75"
        green: "0x98c379"
        yellow: "0xd19a66"
        blue: "0x61afef"
        magenta: "0xc678dd"
        cyan: "0x56b6c2"
        white: "0x828791"

      # Bright colors
      bright:
        black: "0x5c6370"
        red: "0xe06c75"
        green: "0x98c379"
        yellow: "0xd19a66"
        blue: "0x61afef"
        magenta: "0xc678dd"
        cyan: "0x56b6c2"
        white: "0xe6efff"

    catppuccin: &catppuccin # Default colors
      primary:
        background: "#1E1E2E" # base
        foreground: "#CDD6F4" # text
        # Bright and dim foreground colors
        dim_foreground: "#CDD6F4" # text
        bright_foreground: "#CDD6F4" # text

        # Cursor colors
        cursor:
          text: "#1E1E2E" # base
          cursor: "#F5E0DC" # rosewater
        vi_mode_cursor:
          text: "#1E1E2E" # base
          cursor: "#B4BEFE" # lavender

        # Search colors
        search:
          matches:
            foreground: "#1E1E2E" # base
            background: "#A6ADC8" # subtext0
          focused_match:
            foreground: "#1E1E2E" # base
            background: "#A6E3A1" # green
          footer_bar:
            foreground: "#1E1E2E" # base
            background: "#A6ADC8" # subtext0

        # Keyboard regex hints
        hints:
          start:
            foreground: "#1E1E2E" # base
            background: "#F9E2AF" # yellow
          end:
            foreground: "#1E1E2E" # base
            background: "#A6ADC8" # subtext0

        # Selection colors
        selection:
          text: "#1E1E2E" # base
          background: "#F5E0DC" # rosewater

        # Normal colors
        normal:
          black: "#45475A" # surface1
          red: "#F38BA8" # red
          green: "#A6E3A1" # green
          yellow: "#F9E2AF" # yellow
          blue: "#89B4FA" # blue
          magenta: "#F5C2E7" # pink
          cyan: "#94E2D5" # teal
          white: "#BAC2DE" # subtext1

        # Bright colors
        bright:
          black: "#585B70" # surface2
          red: "#F38BA8" # red
          green: "#A6E3A1" # green
          yellow: "#F9E2AF" # yellow
          blue: "#89B4FA" # blue
          magenta: "#F5C2E7" # pink
          cyan: "#94E2D5" # teal
          white: "#A6ADC8" # subtext0

        # Dim colors
        dim:
          black: "#45475A" # surface1
          red: "#F38BA8" # red
          green: "#A6E3A1" # green
          yellow: "#F9E2AF" # yellow
          blue: "#89B4FA" # blue
          magenta: "#F5C2E7" # pink
          cyan: "#94E2D5" # teal
          white: "#BAC2DE" # subtext1

        indexed_colors:
          - { index: 16, color: "#FAB387" }
          - { index: 17, color: "#F5E0DC" }

    kanagawa: &kanagawa
      primary:
        background: "0x1f1f28"
        foreground: "0xdcd7ba"

      normal:
        black: "0x090618"
        red: "0xc34043"
        green: "0x76946a"
        yellow: "0xc0a36e"
        blue: "0x7e9cd8"
        magenta: "0x957fb8"
        cyan: "0x6a9589"
        white: "0xc8c093"

      bright:
        black: "0x727169"
        red: "0xe82424"
        green: "0x98bb6c"
        yellow: "0xe6c384"
        blue: "0x7fb4ca"
        magenta: "0x938aa9"
        cyan: "0x7aa89f"
        white: "0xdcd7ba"

      selection:
        background: "0x2d4f67"
        foreground: "0xc8c093"

      indexed_colors:
        - { index: 16, color: "0xffa066" }
        - { index: 17, color: "0xff5d62" }


    rose-pine: &rose-pine
      primary:
        background: "0x191724"
        foreground: "0xe0def4"
      cursor:
        text: "0xe0def4"
        cursor: "0x524f67"
      vi_mode_cursor:
        text: "0xe0def4"
        cursor: "0x524f67"
      line_indicator:
        foreground: None
        background: None
      selection:
        text: "0xe0def4"
        background: "0x403d52"
      normal:
        black: "0x26233a"
        red: "0xeb6f92"
        green: "0x31748f"
        yellow: "0xf6c177"
        blue: "0x9ccfd8"
        magenta: "0xc4a7e7"
        cyan: "0xebbcba"
        white: "0xe0def4"
      bright:
        black: "0x6e6a86"
        red: "0xeb6f92"
        green: "0x31748f"
        yellow: "0xf6c177"
        blue: "0x9ccfd8"
        magenta: "0xc4a7e7"
        cyan: "0xebbcba"
        white: "0xe0def4"
      hints:
        start:
          foreground: "#908caa"
          background: "#1f1d2e"
        end:
          foreground: "#6e6a86"
          background: "#1f1d2e"
  colors: *${term_theme}
  '';
  ".config/bash/alias.bash".text = ''
    #vim: ft=bash
    #
    alias vim="nvim"
    alias v="nvim"

    alias ga="git add"
    alias gc="git commit"
    alias gd="git diff"
    alias gs="git status"
    alias gp="git push"

    lg="lazygit"

    alias pn="pnpm"
    alias px="pnpx"

    alias ls="exa -h"
    alias ll="exa -lGh"
    alias la="exa -laGh"
  '';
  ".config/bash/exports.bash".text = ''
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
  '';
  ".bashrc".text = ''
    source ~/.config/bash/alias.bash
    source ~/.config/bash/exports.bash

    eval "$(starship init bash)"
  '';
  };
}
