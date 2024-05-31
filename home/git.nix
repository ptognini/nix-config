{ pkgs, config, ... }:
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
      signByDefault = false; #if isLinux then true else false;
      key = "0xDDD13A55026CFA51";
    };
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };

    includes = [
      {
        condition="gitdir=${config.home.homeDirectory}/projects/personal/";
        contents={
          user = {
              name = "Pier Tognini";
              email = "ptognini@gmail.com";
          };
        };
      }
      {
        condition="gitdir=${config.home.homeDirectory}/projects/work/bitbucket";
        contents = {
          user = {
            name = "Pier Tognini";
            email = "ptognini@avaya.com";
          };
        };
      }
      {
        condition="gitdir=${config.home.homeDirectory}/projects/work/github";
        contents = {
          user = {
            name = "Pier Tognini";
            email = "ptognini@avaya.com";
          };
        };
      }
    ];

    #TODO review https://pickard.cc/posts/git-identity-home-manager/
  };
}

