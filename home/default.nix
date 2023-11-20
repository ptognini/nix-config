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
{
  home-manager.users.${userDetails.userName} ={ 
    imports = [
      ./i3.nix
      ./rofi.nix
      ./alacritty.nix
      ./packages.nix
      ./polybar-basic.nix
      ./picom.nix
      ./redshift.nix
      ./vscode.nix
      ./shell.nix
      ./chromium.nix
      ./gtk.nix
      ./nvim.nix
      ./git.nix
      ./xdg.nix
      ./xresources.nix 
      ./screen-capture.nix
      ./qt.nix
      ./zathura.nix
      ./go.nix
      ./gpg.nix
      ./dunst.nix
    ];
    xsession.enable = true;
    home.sessionVariables = {
      JAVAX_NET_SSL_TRUSTSTORE = "$HOME/.config/java-cacerts";
    }; 
};
}

