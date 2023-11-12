{
  lib,
  inputs,
  system,
  config,
  pkgs,

  username,
  fullname,
  ...
}:{

  # uncomment for fun
  #boot.kernelPackages = pkgs.linuxPackages_zen;

  boot.kernel.sysctl = {
  	"vm.overcommit_memory" = 1;
  };

}
