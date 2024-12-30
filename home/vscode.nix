{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;

    extensions = (with pkgs.vscode-extensions; [
      golang.go
      mhutchie.git-graph
      github.copilot
      github.copilot-chat
      github.vscode-pull-request-github
      gruntfuggly.todo-tree
      brettm12345.nixfmt-vscode
      #vscodevim.vim
      yzhang.markdown-all-in-one
      ms-vscode.makefile-tools
      vscjava.vscode-java-pack
      redhat.java
      mvllow.rose-pine
      pkief.material-icon-theme
      humao.rest-client
      ms-azuretools.vscode-docker
      eamodio.gitlens
      ms-vscode.cpptools-extension-pack
      humao.rest-client
      davidanson.vscode-markdownlint
      zxh404.vscode-proto3
      donjayamanne.githistory
      
      #pbkit.vscode-pbkit
      #peterj.proto

      #kruemelkatze.vscode-dashboard
      #iteratec.bdd-power-tools
      #tamassoos.bdd-highlighter
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

      window = {
        customTitleBarVisibility = "auto";
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
        #ui = {
          semanticTokens = true;
        #};
      };
    };
  };
}
