{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "rose-pine-wallpapers";
  src = pkgs.fetchgit {
    url = "https://github.com/rose-pine/wallpapers";
    #rev = "main";  # Specify the commit, tag, or branch you want to download.
    sha256 = "RPWJ+gseLtScAIgBlpeAUX7gEPzv3fbMZ0IS4TmKbaY=";
  };

  installPhase = ''
    mkdir -p $out
    cp -r ./* $out/
  '';
}
