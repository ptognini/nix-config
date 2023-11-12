{ gtk-nix, config, pkgs, lib, ... }:
{
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 48;
    gtk.enable = true;
    x11.enable = true;
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
# gtk's theme settings, generate files: 
#   1. ~/.gtkrc-2.0
#   2. ~/.config/gtk-3.0/settings.ini
#   3. ~/.config/gtk-4.0/settings.ini
  gtk = {
    enable = true;

    font = {
      name = "Roboto";
      package = pkgs.roboto;
      size = 10;
    };

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

    iconTheme = {
      #name = "Papirus-Dark";
      #package = pkgs.papirus-icon-theme;
      name = "rose-pine";
      package = pkgs.rose-pine-icon-theme;
    };

    theme = {
# https://github.com/catppuccin/gtk
      name = "rose-pine-moon";
      package = pkgs.rose-pine-gtk-theme;

      #name = "Catppuccin-Mocha-Standard-Pink-Dark";
      #package = pkgs.catppuccin-gtk.override {
# https://github.com/NixOS/nixpkgs/blob/nixos-23.05/pkgs/data/themes/catppuccin-gtk/default.nix
      #  accents = [ "pink" ];
      #  size = "standard";
      #  variant = "mocha";
      #};t
    };

    gtk3.bookmarks = [
      "file:///${config.home.homeDirectory}/projects"
      "file:///${config.home.homeDirectory}/Pictures/screenshots"
    ];

    gtk3 = {
        extraConfig = {
          #gtk-application-prefer-dark-theme = 1;
          #gtk-icon-sizes = "panel-menu=16,16:gtk-large-toolbar=24,24";
        };
      };
      gtk4 = {
        extraConfig = {
          #gtk-application-prefer-dark-theme = 1;
        };
      };
  };

  services.xsettingsd = {
    enable = true;
    settings = {
      "Gtk/DecorationLayout" = ":";
      "Net/EnableInputFeedbackSounds" = 0;
      "Net/ThemeName" = "${config.gtk.theme.name}";
    };
  };
}

