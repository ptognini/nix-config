{
  config,
  pkgs,
  ...
}: {
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
        browser = ["chromium.desktop"];
        nnn = ["nnn.desktop"];
      in {
        "application/json" = browser;
        "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop"; 

        "text/html" = browser;
        "text/xml" = browser;
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
        "x-scheme-handler/unknown" = browser;
        "inode/directory" = nnn;        

      };

      associations.removed =
        {
          # ......
        };
    };

    userDirs = {
      enable = false;
      createDirectories = false;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
  };


  xdg.desktopEntries = {

    tmux-default= {
      name = "Tmux default session";
      genericName = "Tmux default session";
      exec = "alacritty --class Alacritty,default-tmux -e tmux new-session -s default -A";
      icon = "utilities-terminal";
    };

    teams = {
      name = "MS Teams Web";
      genericName = "MS Teams Collaboration";
      exec = "teams.sh";
      icon = "office-contact";
    };

    outlook = {
      name = "Outlook Web";
      genericName = "MS Outlook for Web";
      exec = "outlook.sh";
      icon = "mail-message-new-symbolic";
    };

    music = {
      name = "Youtube Music";
      genericName = "Youtube Music";
      exec = "chromium -app=https://music.youtube.com";
    };

    vimCheatSheet = {
      name = "Vim Cheat Sheet";
      genericName = "Vim Cheat Sheet";
      exec = "chromium -app=https://vim.rtorr.com";
    };

    reddit = {
      name = "Reddit";
      genericName = "Reddit";
      exec = "chromium -app=https://reddit.com";
    };

    twitter = {
      name = "Twitter";
      genericName = "Twitter";
      exec = "chromium -app=https://x.com";
    };

    chatgpt = {
      name = "ChatGPT";
      genericName = "ChatGPT";
      exec = "chromium -app=https://chat.openai.com";
    };

    rocketchat = {
      name = "Rocket Chat";
      genericName = "Rocket Chat";
      exec = "chromium -app=https://avaya.rocket.chat";
    };
  };


}
