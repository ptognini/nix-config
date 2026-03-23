{ config, pkgs, lib, ... }:
with lib;
{
  config = {
    home.packages = with pkgs; [
      go
      # editor support
      go-tools # honnef.co/go/tools/...@latest
      gotools # golang.org/x/tools
      gotests # github.com/cweill/gotests
      impl # github.com/josharian/impl
      reftools # github.com/davidrjenni/reftools/cmd/fillstruct
      gomodifytags # github.com/fatih/gomodifytag
      revive # github.com/mgechev/revive
      delve # github.com/go-delve/delve/cmd/dlv
      gopls
      protoc-gen-go
      gotestsum
      gofumpt
      mockgen
      golangci-lint
      richgo
      graphviz
    ];

    programs.neovim.plugins = with pkgs.vimPlugins; [ vim-go ];

    programs.vscode = {
      profiles.default = {
        userSettings = {
          "go.docsTool" = "godoc";
          "go.formatTool" = "goimports";
          "go.useLanguageServer" = true;
        };

        extensions = (with pkgs.vscode-extensions; [
          golang.go
        ]);
      };
    };

    home.sessionVariables = {
      GOPATH = "${config.xdg.dataHome}/go";
    };

  };
}
