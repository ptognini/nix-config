{ config, lib, ... }:
{
  programs.gpg.enable = true;
  programs.gpg.homedir = "${config.xdg.dataHome}";
  programs.gpg.mutableKeys = true;
  programs.gpg.mutableTrust = true;
  services.gpg-agent = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableExtraSocket = true;
    enableScDaemon = false; #no smart card
    enableSshSupport = true;
    pinentryFlavor = lib.mkDefault "curses";
    
    
  };
}
