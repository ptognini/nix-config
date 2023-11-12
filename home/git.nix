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
  };
}



