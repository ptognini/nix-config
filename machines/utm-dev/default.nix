# machine specific configuration goes here
{
  lib,
  inputs,
  system,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Hostname
  networking.hostName = "prl-dev";
  
  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = [ pkgs.mesa.drivers ];
  hardware.opengl.driSupport = true;
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
  	enable = true;
	  alsa.enable = true;
	  alsa.support32Bit = true;
	  pulse.enable = true;
	  wireplumber.enable = true;
  };

  services.upower.enable = true;
}
