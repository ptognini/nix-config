{ pkgs, ... }:
let isLinux = pkgs.stdenv.hostPlatform.isLinux;
in {
  programs.git = {
    package = pkgs.gitFull;
    enable = true;
    aliases = {
      ci = "commit";
      co = "checkout";
      s = "status";
    };
    signing = {
      signByDefault = if isLinux then true else false;
      key = "0xDDD13A55026CFA51";
    };
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
    ### check options here https://git-scm.com/docs/git-config
    extraConfig = {
      includeIf = {
        "gitdir=~/projects/personal/" = {
          userName = "andreaugustoaragao";
          userEmail = "andrearag@gmail.com";
        };
      };
      includeIf = {
        "gitdir=~/projects/work/" = {
          userName = "aragao";
          userEmail = "aragao@avaya.com";
        };
      };
    };
  };
}

