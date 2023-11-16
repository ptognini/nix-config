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
<<<<<<< HEAD
      ./dunst.nix
=======
>>>>>>> refs/remotes/origin/main
    ];
    xsession.enable = true;
    home.sessionVariables = {
      JAVAX_NET_SSL_TRUSTSTORE = "$HOME/.config/java-cacerts";
    }; 
};
#        $DRY_RUN_CMD trust extract --format=java-cacerts --purpose=server-auth ~/.config/java-cacerts
}

