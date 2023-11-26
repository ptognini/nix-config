{ pkgs, ... }:
let
  chromiumWideVine = pkgs.chromium.overrideAttrs { 
    enableWideVine = true; 
    enableVaapi = true;
  };


in {
  programs.chromium = {
	  enable = true;
	  package = chromiumWideVine; #pkgs.chromium;
	  dictionaries = [ 
		  pkgs.hunspellDictsChromium.en_US
	  ];
	  extensions = [
		{id="cjpalhdlnbpafiamejdnhcphjbkeiagm";} #ublock origin
		{id="aeblfdkhhhdcdjpifhhbdiojplfjncoa";} #1password
		{id="dbepggeogbaibhgnhhndojpepiihcmeb";} #vimium
		{id="noimedcjdohhokijigpfcbjcfcaaahej";} #rose-pine theme
		{id="danncghahncanipdoajmakdbeaophenb";} #auto group tabs
		{id="eimadpbcbfnmbkopoojfekhnkhdbieeh";} #dark reader
	  ];
  };
	nixpkgs.config.enableWideWine = true;
}
