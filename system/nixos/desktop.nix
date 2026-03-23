{ config, pkgs, userDetails, desktopDetails, ... }: {
  services = {
    xserver = {
      enable = true;
      displayManager = {
        lightdm.enable = true;
      };
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          rofi
          pavucontrol
          xcolor
          xclip
          xdo
          xdotool
          xsel
          firefox
          font-manager
          neovide
          pavucontrol
          obsidian
          zathura
          evince
          foliate
          inkscape-with-extensions
          libreoffice
        ];
        extraSessionCommands = ''
          spice-vdagent
          xrandr --output Virtual-1 --auto
        '';
      };

      xkb.layout = "us";
      xkb.variant = "intl";
      xkb.options = "caps:escape";

    };

    libinput = {
      enable = true;
      touchpad.tapping = true;
      touchpad.naturalScrolling = true;
      touchpad.scrollMethod = "twofinger";
      touchpad.disableWhileTyping = false;
      touchpad.clickMethod = "clickfinger";
      mouse.naturalScrolling = true;
    };

    displayManager = {
      defaultSession = "none+i3";
      autoLogin = {
        enable = true;
        user = "${userDetails.userName}";
      };
    };
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
  };
  programs = {
    thunar = {
      enable = true;
      plugins = with pkgs; [
        xfce.thunar-archive-plugin
        xfce.thunar-volman
        xfce.thunar-media-tags-plugin
        file-roller
      ];
    };
    dconf.enable = true;
  };
}
