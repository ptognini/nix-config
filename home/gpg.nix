{ config, lib, ... }:
{
  programs.gpg.enable = true;
  programs.gpg.homedir = "${config.xdg.dataHome}/gnupg";
  programs.gpg.mutableKeys = true;
  programs.gpg.mutableTrust = true;
  services.gpg-agent = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableExtraSocket = true;
    enableScDaemon = false; #no smart card
    enableSshSupport = true;
    extraConfig = ''
      log-file /home/aragao/gpg-log.log
      verbose
      debug-level guru
    '';
    #pinentryFlavor = lib.mkDefault "curses";
  };
}
