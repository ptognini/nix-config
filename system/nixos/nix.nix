{
  lib,
  inputs,
  system,
  config,
  pkgs,
  ...
}: {
  nix = {
    package = pkgs.nixVersions.latest; #nixFlakes;
    optimise.automatic = true;
    gc = {
      automatic = true;
      dates = "monthly";
      options = "--delete-older-than 180d";
    };

    extraOptions = ''
      experimental-features = nix-command flakes

    '';
  };

  nixpkgs.config.allowUnfree = true;
}
