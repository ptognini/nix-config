{
  pkgs ? import <nixpkgs> {} 
}:
pkgs.stdenv.mkDerivation rec {
  name= "firefox-ui-fix";
  src = pkgs.fetchFromGitHub {
      owner = "black7375";
      repo = "Firefox-UI-Fix";
      rev = "8c6140ce20b85d6a7292980b0408b75731f2ec5e";
      fetchSubmodules = false;
      sha256 = "wmh3cJ1GYlmCjUgqRg2t2LLv2cWQDmK9KjwIjJXHcCg=";
    };
  date = "2023-11-07";

  installPhase = ''
    mkdir -p $out/
    cp -r user.js icons/ css/ $out/
  '';
}
