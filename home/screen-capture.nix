{ pkgs,config,lib, ... }:
{
  services.flameshot = 
  {
    enable = true;
    settings = {
      General = {
        disabledTrayIcon = false;
        showStartupLaunchMessage = false;
        savePath = "${config.home.homeDirectory}/Pictures/screenshots";
      };
    };
  };
}
