# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).
{
  lib,
    inputs,
    system,
    config,
    pkgs,
    userDetails,
    ...
}:
{
  imports = [
    ./nix.nix         
    ./packages.nix
    ./fonts.nix
    ./locale.nix
    ./kernel.nix
    ./certs.nix
    ./desktop.nix
    ./tmux
  ]; 

# NETWORK
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  systemd.network.wait-online.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;

# SECURITY
  security.polkit.enable = true;
  security.rtkit.enable = true;
  programs.seahorse.enable = true;
  services.gnome.gnome-keyring.enable = true;

# USER SETUP
  users.users = {
  	${userDetails.userName} = {
		  createHome = true;
		  description = "${userDetails.fullName}";
		  isNormalUser = true;
		  extraGroups = [
			  "wheel"
			    "docker"
		  ];
		  shell = pkgs.fish;
	  };
  };
  programs.fish.enable = true; # make shell assertion happy, it doesn't know about home manager.
  environment.pathsToLink = [ "/libexec"];

# DOCKER
  virtualisation.docker.enable = true;

# LOCATION SERVICES
  services.geoclue2.enable = true;
  location.provider = "geoclue2";
  services.localtimed.enable = true;

# KEYBOARD SANITY
  services.keyd = {
    enable = true;
    keyboards.default.settings = {
      main.capslock = "overload(control, esc)";
    };
  };

# MISC
  documentation.man.generateCaches = true;

  programs.nix-ld.enable = true;

  programs.command-not-found.enable = false;

  environment.variables = {
    GDK_SCALE = "2"; 
    GDK_DPI_SCALE = "0.5";
    #_JAVA_OPTIONS = "-Dsun.java2d.uiScale=1";
    #QT_SCALE_FACTOR = "1";
  };

  environment.localBinInPath = true;

  services.envfs.enable = true;

  system.stateVersion = "23.05"; # Do not change this number?
  #github.com/R-VdP/nixos-config
}

