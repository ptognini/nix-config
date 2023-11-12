{ config, pkgs, lib, ... }:

{
  # create ~/.config/systemd/user/default.target.wants/redshift.service to enable
  services.redshift = {
    enable = true;
    settings.redshift = {
      brightness-day = "1";
      brightness-night = "0.8";
      adjustment-method = "randr";
    };

    temperature = {
      day = 5500;
      night = 3000;
    };
    #longitude = "-105.0867";
    #latitude = "39.9205";
    provider = "geoclue2";
    tray=false;
  };
}
