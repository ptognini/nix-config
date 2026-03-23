{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "rose-pine-wallpapers";
  src = pkgs.fetchFromGitHub {
    owner = "rose-pine";
    repo = "wallpapers";
    rev = "9b1a09f2b99e0378620215a6169109b3d505a5a3";
    # build once to get correct hash from error, then paste it here
    sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  installPhase = ''
    mkdir -p $out
    cp -r ./* $out/
  '';
}
