{
  lib,
    inputs,
    system,
    config,
    pkgs,
    userDetails,
    desktopDetails,
    ...
}:
let
  lfIcons = pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/gokcehan/lf/master/etc/icons.example";
    sha256 = "sha256-c0orDQO4hedh+xaNrovC0geh5iq2K+e+PZIL5abxnIk=";
  };
  lfColors = pkgs.fetchurl {
    url =
      "https://raw.githubusercontent.com/gokcehan/lf/master/etc/colors.example";
    sha256 = "sha256-cYJlXuRjuotQ1aynPG5+UGK2nBBNg/6xRiGs2mBpKeY=";
  };
in 
{
  programs.lf = {
    enable = true;
    settings = {
      number = false;
      icons = true;
    };
    previewer.source = pkgs.writeShellScript "pv.sh" ''
      #!/bin/sh
      case "$1" in
          *.tar*) tar tf "$1";;
          *.zip) unzip -l "$1";;
          *.rar) unrar l "$1";;
          *.7z) 7z l "$1";;
          *.pdf) pdftotext "$1" -;;
          *) bat --color=always "$1";;
      esac
    '';
  };
  xdg.configFile."lf/icons" = { source = lfIcons; };
  xdg.configFile."lf/colors" = {source = lfColors; };
  xdg.configFile."Thunar/uca.xml" = { source = ./uca.xml; };
  xdg.configFile."xfce4/xfconf/xfce-perchannel-xml/thunar.xml" = { source = ./thunar.xml; };
}
