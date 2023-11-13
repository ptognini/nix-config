{ pkgs, ... }:

with pkgs;
let
  default-python = python3.withPackages (python-packages:
    with python-packages; [
      pip
      virtualenv
      black
      flake8
      setuptools
      wheel
      twine
    ]);
in {
  home.packages = with pkgs; [

# TERMINAL
    any-nix-shell
    neofetch  
    escrotum      #screen recording
    gnupg    
    feh
    lolcat

# DEVELOPMENT
    jetbrains.idea-ultimate
    jetbrains.goland
    nixfmt
    default-python
    jdk17
    gradle
    maven
    gcc
    m4
    gnumake
    binutils
    gdb
    rustup
    
    lazygit

    # kafka
    avro-tools
    kcat

    # cloud
    kubectl
    kubelogin
    kubernetes-helm
    k9s
    azure-cli
    lazydocker

    # SYSADMIN
    remmina

    # DEFAULT
    pavucontrol
    bottom
    neovide
    fd
    libnotify
    jq
    yq
    gdu
    obsidian
    zathura
    asciinema
    flameshot
    evince
    foliate
  ];

}
