{
  lib,
  inputs,
  system,
  config,
  pkgs,
  ...
}:
{
  nix = {
 package = pkgs.nixFlakes;
	  optimise.automatic = true;
	  gc = {
	    automatic = true;
	    dates = "weekly";
	    options = "--delete-older-than 7d";
	  };

	  extraOptions = ''
		  experimental-features = nix-command flakes
		  '';
  };

  nixpkgs.config.allowUnfree = true;
}
