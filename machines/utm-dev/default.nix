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
  networking.hostName = "utm-dev";
  
  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = [ pkgs.mesa.drivers pkgs.virglrenderer ];
  hardware.opengl.driSupport = true;

  virtualisation.libvirtd.enable = true;
  virtualization.libvirtd.qemu.package = pkgs.qemu_kvm;
  services.qemuGuest.enable = true;
  
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
