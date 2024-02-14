{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;

    extensions = (with pkgs.vscode-extensions; [
      brettm12345.nixfmt-vscode
      vscodevim.vim
      yzhang.markdown-all-in-one
      ms-vscode.makefile-tools
      golang.go
      redhat.java
      mvllow.rose-pine
      pkief.material-icon-theme
      humao.rest-client
      ms-azuretools.vscode-docker
    ]); 

    userSettings = {
      update.mode = "none";
      window.zoomLevel = 0;
      terminal.integrated.fontFamily = "JetBrainsMono Nerd Font";
      terminal.integrated.fontSize = 14;
      terminal.integrated.shell.linux = "${pkgs.fish}/bin/fish";
      terminal.integrated.defaultProfile.linux = "${pkgs.fish}/bin/fish";

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

      terminal = {
        integrated.scrollback = 100000;
        integrated.stickyScroll.enabled = true
      };

      gopls = {
        analyses = "{"fieldalignment": true, "unusedvariable":false}";
        ui.semanticTokens = true
      }
    };
  };
}
