{ pkgs, ... }:
{
  programs.git = {

    package = pkgs.gitFull;

    enable = true;

    aliases = {
      ci = "commit";
      co = "checkout";
      s = "status";
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
        "gitdir=~/projects/work/" = {
          userName = "aragao";
          userEmail = "aragao@avaya.com";
        };
      };
    };
  };
}



