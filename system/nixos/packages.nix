{
  lib,
  inputs,
  system,
  config,
  pkgs,
  ...
}: {
  # available to root and ${userDetails.userName}
  environment.systemPackages = with pkgs; [
    lf
    starship
    inetutils
    unzip
    zip
    unrar
    p7zip
    tree
    fzf
    fortune
    dwt1-shell-color-scripts
    git
    subversion
    curl
    wget
    psmisc # provides killall, fuser, pstree
    htop
    btop
    ripgrep
    entr
    lolcat
    cowsay
    nixd
    fd
    lua-language-server
    bash-language-server
    p11-kit #used to generate java ca-certs
    mesa-demos
    minikube
    openssl
    nix-prefetch-github
    redis
    onefetch
    speedtest-cli
    gh
    #nodejs_20
    wireshark
    nmap
  ];
}
