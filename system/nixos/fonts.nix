{config, pkgs, ...}:
{
  fonts.packages = with pkgs; [
	  #(nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" "DroidSansMono" ]; })

      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono
	    dejavu_fonts
	    noto-fonts
	    noto-fonts-cjk-sans
	    noto-fonts-emoji
      terminus_font
      roboto
      roboto-mono
      roboto-slab
      hasklig
      material-design-icons
      material-icons
      source-code-pro
      source-sans-pro
  ];

  fonts.enableDefaultPackages = true;
  fonts.fontconfig = {
  	hinting = {
		  enable = true;
		  style = "slight";
	  };
	  subpixel.rgba = "rgb";
    subpixel.lcdfilter = "default";
    enable = true;
    defaultFonts = {
      monospace = ["Roboto Mono 13"];
      sansSerif = ["Roboto 13"];
      serif = ["Roboto Slab 13"];
    };
  };
}
