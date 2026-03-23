{
  config,
  pkgs,
  lib,
  ...
}:
let
  chatGptIcon = pkgs.fetchurl {
    url = "https://cdn.oaistatic.com/_next/static/media/apple-touch-icon.59f2e898.png";
    sha256 = "sha256-FiakJNu7xQF0Uw+5ffraemLHHzA//bh92sBPPNOFngg=";
  };

  msTeamsIcon = pkgs.fetchurl {
    url = "https://cdn.icon-icons.com/icons2/2397/PNG/512/microsoft_office_teams_logo_icon_145726.png";
    sha256 = "sha256-zEx415L+EVGzohnaEC8T/vJrPMVCq2yJdd4IE4Yb6yA=";
  };

  msOutlookIcon = pkgs.fetchurl {
    url = "https://cdn.icon-icons.com/icons2/2397/PNG/512/microsoft_office_outlook_logo_icon_145721.png";
    sha256 = "sha256-Fkpi75V9Aim1viI8Cf/a1VdZ0jaQKrUurxMburFqsSk=";
  };

  rocketChatIcon = pkgs.fetchurl {
    url = "https://cdn.icon-icons.com/icons2/2621/PNG/512/brand_rocket_chat_icon_157334.png";
    sha256 = "sha256-ywd/8u99kAxR8UQY2Gut58LPHFriwmbrbUSZ+xxag+U=";
  };

  redditIcon = pkgs.fetchurl {
    url = "https://cdn.icon-icons.com/icons2/1195/PNG/512/1490889653-reddit_82537.png";
    sha256 = "sha256-W5SNuLLvLfE3qHCj1zOwX0audC6RR/rq+XWOYT1WieM=";
  };

  twitterIcon = pkgs.fetchurl {
    url = "https://cdn.icon-icons.com/icons2/836/PNG/512/Twitter_icon-icons.com_66803.png";
    sha256 = "sha256-43X/6zjbombCqR9oxmPrwNzvI92G0yF5lyGcQfGh7Og=";
  };

  vimCheatSheetIcon = pkgs.fetchurl {
    url = "https://cdn.icon-icons.com/icons2/1381/PNG/512/vim_94609.png";
    sha256 = "sha256-37SocmqoQ+VPVD8NF/scJnX7iqFZca8mPmThTA7Yvlw=";
  };

  youtubeMusicIcon = pkgs.fetchurl {
    url = "https://cdn.icon-icons.com/icons2/3132/PNG/512/youtube_music_social_network_song_multimedia_icon_192250.png";
    sha256 = "sha256-f5+2rCjJKHOmWkMEov+grK3aRMx4Du5xhWr5kvZhM3Y=";
  };
in
{
  home.packages = with pkgs; [
    xdg-utils # provides cli tools such as `xdg-mime` `xdg-open`
    xdg-user-dirs
  ];

  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.local/cache";

    # manage $XDG_CONFIG_HOME/mimeapps.list
    # xdg search all desktop entries from $XDG_DATA_DIRS, check it by command:
    #  echo $XDG_DATA_DIRS
    # the system-level desktop entries can be list by command:
    #   ls -l /run/current-system/sw/share/applications/
    # the user-level desktop entries can be list by command(user ryan):
    #  ls /etc/profiles/per-user/ryan/share/applications/
    mimeApps = {
      enable = true;
      defaultApplications = let
        browser = ["firefox.desktop"];
        lf = ["lf.desktop"];
        nvim = ["nvim.desktop"];
      in {
        
        "application/json" = nvim;
        "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop"; 

        "text/html" = browser;
        "text/xml" = nvim;
        "text/plain" = nvim;
        "text/markdown" = nvim;
        "text/x-go" = nvim;
        "text/x-java" = nvim;
        "text/x-python" = nvim;
        "application/x-shellscript" = nvim;
        "application/yaml"=nvim;
        "application/xml" = browser;
        "application/xhtml+xml" = browser;
        "application/xhtml_xml" = browser;
        "application/rdf+xml" = browser;
        "application/rss+xml" = browser;
        "application/x-extension-htm" = browser;
        "application/x-extension-html" = browser;
        "application/x-extension-shtml" = browser;
        "application/x-extension-xht" = browser;
        "application/x-extension-xhtml" = browser;

        "x-scheme-handler/about" = browser;
        "x-scheme-handler/ftp" = browser;
        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "x-scheme-handler/unknown" = nvim;
        "inode/directory" = "thunar.desktop";        
        "image/*" = browser;
        

      };

      associations.removed =
        {
          # ......
        };
    };

  
    userDirs = {
      download = "${config.home.homeDirectory}/downloads";
      documents = "${config.home.homeDirectory}/projects";
      enable = false;
      createDirectories = false;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs}/screenshots";
      };
    };
  };


  xdg.desktopEntries = {
    tmux-default= {
      name = "Tmux Default Session";
      genericName = "Tmux default session";
      exec = "alacritty --class Alacritty,default-tmux -e tmux new-session -s default -A";
      icon = "utilities-terminal";
    };

    teams = {
      name = "Teams";
      genericName = "Microsoft Teams";
      exec = "chromium -app=https://teams.microsoft.com";
      #icon = msTeamsIcon;
      icon = "teams";
    };

    outlook = {
      name = "Outlook";
      genericName = "Microsoft Outlook";
      exec = "chromium -app=https://outlook.office.com";
      #icon = msOutlookIcon;
      icon = "ms-outlook";
    };

    music = {
      name = "Youtube Music";
      genericName = "Youtube Music";
      exec = "chromium -app=https://music.youtube.com";
      icon = youtubeMusicIcon;
    };

    vimCheatSheet = {
      name = "Vim Cheat Sheet";
      genericName = "Vim Cheat Sheet";
      exec = "chromium -app=https://vim.rtorr.com";
      icon = vimCheatSheetIcon;
    };

    reddit = {
      name = "Reddit";
      genericName = "Reddit";
      exec = "chromium -app=https://reddit.com";
      icon = redditIcon;
    };

    twitter = {
      name = "Twitter";
      genericName = "Twitter";
      exec = "chromium -app=https://x.com";
      icon = twitterIcon;
    };

    chatgpt = {
      name = "ChatGPT";
      genericName = "ChatGPT";
      exec = "chromium -app=https://chat.openai.com";
      icon = chatGptIcon;
    };

    rocketchat = {
      name = "Rocket Chat";
      genericName = "Rocket Chat";
      exec = "chromium -app=https://avaya.rocket.chat";
      icon = rocketChatIcon; 
    };
  };
  
  home.activation = with config.xdg; {
      createXdgCacheAndDataDirs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        $DRY_RUN_CMD mkdir --parents $VERBOSE_ARG \
          ${config.home.homeDirectory}/screenshots

        $DRY_RUN_CMD mkdir --parents $VERBOSE_ARG \
          ${config.home.homeDirectory}/projects

        $DRY_RUN_CMD mkdir --parents $VERBOSE_ARG \
          ${config.home.homeDirectory}/projects/personal
   
        $DRY_RUN_CMD mkdir --parents $VERBOSE_ARG \
          ${config.home.homeDirectory}/projects/work

        $DRY_RUN_CMD mkdir --parents $VERBOSE_ARG \
          ${config.home.homeDirectory}/screenshots

      '';

      #TODO remove this from here - should be in the java.nix file
      createJavaCertificates = lib.hm.dag.entryAfter [ "writeBoundary"] ''
        if [ ! -f $HOME/.config/java-cacerts ]; then 
          $DRY_RUN_CMD ${pkgs.p11-kit.bin}/bin/trust extract --format=java-cacerts --purpose=server-auth $HOME/.config/java-cacerts
        fi 
      '';
    };

}
