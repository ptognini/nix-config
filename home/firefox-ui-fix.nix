{
  pkgs ? import <nixpkgs> {}
}:
pkgs.stdenv.mkDerivation rec {
  name= "firefox-ui-fix";
  src = pkgs.fetchFromGitHub {
      owner = "black7375";
      repo = "Firefox-UI-Fix";
      rev = "8c6140ce20b85d6a7292980b0408b75731f2ec5e";
      # build once to get correct hash from error, then paste it here
      sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    };
  date = "2023-11-07";

  installPhase = ''
    mkdir -p $out/
    cp -r user.js icons/ css/ $out/
  '';
}
