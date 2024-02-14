{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;

    extensions = (with pkgs.vscode-extensions; [
      brettm12345.nixfmt-vscode
      #vscodevim.vim
      yzhang.markdown-all-in-one
      ms-vscode.makefile-tools
      golang.go
      redhat.java
      mvllow.rose-pine
      pkief.material-icon-theme
      humao.rest-client
      ms-azuretools.vscode-docker
      mhutchie.git-graph
    ]); 

    userSettings = {
      update.mode = "none";
      window.zoomLevel = 0;

      terminal = {
        integrated.fontFamily = "JetBrainsMono Nerd Font";
        integrated.fontSize = 14;
        integrated.shell.linux = "${pkgs.fish}/bin/fish";
        integrated.defaultProfile.linux = "${pkgs.fish}/bin/fish";
        integrated.stickyScroll.enabled = true;
        integrated.scrollback = 100000;
      };

      telemetry.telemetryLevel = "off";

      editor = {
        fontFamily =
          "'JetbrainsMono Nerd Font', 'monospace', monospace, 'Droid Sans Fallback'";
        fontLigatures = true;
        inlineSuggest.enabled = true;
        bracketPairColorization.enabled = true;
        minimap.enabled = false;
        stickyScroll.enabled = true;
        stickyScroll.defaultModel = "indentationModel";
        stickyScroll.maxLineCount = 6;
      };

      workbench = {
        iconTheme = "material-icon-theme";
        colorTheme = "Visual Studio Dark - C++"; 
        activityBar.location = "top";
        sideBar.location = "right";
      };
      
      gopls = {
        analyses = {
          fieldalignment = true; 
          unusedvariable = false;
        };
        ui.semanticTokens = true;
      };
    };
  };
}
