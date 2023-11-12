{ pkgs, ... }:
let 

	#background = "#282A2E";
	#background-alt = "#373B41";
	#foreground = "#C5C8C6";
	#primary = "#F0C674";
	#secondary = "#8ABEB7";
	#alert = "#A54242";
	#disabled = "#707880";
  
  background = "#191724";
  background-transparent = "#FF191724";
  background-alt = "#26233a";
  foreground = "#e0def4";
  #https://materialpalettes.com/
  primary = "#f6c177";
  secondary = "#124d63";
  tertiary ="#31748f";
  quaternary = "#5b96b2";
  quinary = "#b4def0";

  alert = "#eb6f92";
  disabled = "#6e6a86";
in {

  services.polybar = {
    package = pkgs.polybar.override {
      i3Support = true;
      alsaSupport = true;
      pulseSupport = true;
    };
    enable = true;
    script = "polybar -q -r top &";

    config = {

      "bar/top" = {
        dpi-x = 0;
        dpi-y = 0;
        bottom = false;
        fixed-center = true;
        override-redirect = true;
#        width = "99%";
#        offset-x = "32";
        offset-y = "0";
        height = 65;
        #radius = 25;
#offset-x = 150;
#offset-y = 150;
        background = "${background-transparent}";
        foreground = "${foreground}";
        line-size = "2pt";
        border-size = "0pt";
        border-color = "#00000000";
#padding = 10;
#padding-left = 1;
#padding-right = 1;

        module-margin-left = 0;
        module-margin-right = 0;

        separator = " ";
        separator-foreground = "${disabled}";
# font-0 = "FiraCode Nerd Font:size=12;2;style=bold";
        font-0 = "JetbrainsMono Nerd Font:size=10:weight=bold;4";
        font-1 = "JetbrainsMono Nerd Font:size=10:weight=bold;4";
        font-2 = "JetbrainsMono Nerd Font Mono:size=20:weight=bold;7";
        modules-left="xworkspaces xwindow";
        modules-right = "tray filesystem memory cpu network battery date";

        cursor-click = "pointer";
        cursor-scroll = "ns-resize";
        wm-restack = "i3";
        enable-ipc = true;

        tray-position = "right";
        tray-maxsize = 30;
        tray-padding = 10;
        tray-offset-x = 0;
      };

      "module/tray" = {
        type = "internal/tray";
      };

      "module/xworkspaces" = {
        type = "internal/i3";
        format = "<label-state> <label-mode>";
        ws-icon-0 = "1;  "; #terminal
        ws-icon-1 = "2;  "; #browser
        ws-icon-2 = "3; 󰊻 "; #teams
        ws-icon-3 = "4; 󰴢 "; #outlocker
        ws-icon-4 = "5;  "; #idea
        ws-icon-5 = "6;  "; #rocket chat
        ws-icon-6 = "7; 󱔘 "; #documents: pdfs and books and images and powerpoint and excel
        ws-icon-7 = "8;  "; #music
        ws-icon-8 = "9; 󱜸 "; #chat gpt
        ws-icon-default = "  ";

        label-focused = "%icon%";
        label-focused-padding = 0;
        label-focused-underline = "${primary}";
        label-focused-background = "${background-alt}";
        label-focused-font = "3";

        label-unfocused = "%icon%";
        label-unfocused-font = 3;
        label-unfocused-padding = 0;

        label-visible = "%icon%";
        label-visible-font = 3;
 #       label-visible-padding = 1;

        label-urgent = "%icon%";
  #      label-urgent-padding = 1;
        label-urgent-background = "${alert}";
        label-urgent-font = 3;
        #label-active-background = "${background-alt}";
        #label-active-underline= "${primary}";
        #label-active-padding = 1;
      };

      "module/xwindow" = {
        type = "internal/xwindow";
        label = "%title%";
        label-maxlen = 50;
      };

      "module/date" = {
        type = "internal/date";
        interval = 5;
        date = "%a %b %d %l:%M %p ";
        label = "%date%";
        label-padding-x = 2;
#label-foreground = "${primary}";
      };


      "module/memory" = {
        type = "internal/memory";

        interval = 3;

        format = "󰍛 <label>";
#format-background = tertiary;
#format-foreground = secondary;
        format-padding = 1;

        label = "%gb_used%/%gb_total%";
        format-underline = tertiary;
        label-font = 2;
      };

      "module/cpu" = {
        type = "internal/cpu";

        interval = "0.5";

        format = "󰻠 <label>";
        format-underline = quaternary;

#format-foreground = quaternary;
#format-background = secondary;
#format-padding = 1;

        label = "%percentage:2%%";
        #label-underling = secondary;
        label-font = 2;
      };


      "module/battery" = {
        type = "internal/battery";
        full-at = 101; # to disable it
        battery = "BAT0"; # TODO: Better way to fill this
        adapter = "AC0";

        poll-interval = 2;

        label-full = "  100%";
        format-full-padding = 0;
        #format-full-foreground = secondary;
        #format-full-background = primary;

        format-charging = " <animation-charging> <label-charging>";
        format-charging-padding = 0;
        #format-charging-foreground = secondary;
        #format-charging-background = primary;
        label-charging = " %percentage%%";
        animation-charging-0 = "";
        animation-charging-1 = "";
        animation-charging-2 = "";
        animation-charging-3 = "";
        animation-charging-4 = "";
        animation-charging-framerate = 500;

        format-discharging = "<ramp-capacity> <label-discharging>";
        format-discharging-padding = 0;
        # format-discharging-foreground = secondary;
        # format-discharging-background = primary;
        label-discharging = " %percentage%%";
        ramp-capacity-0 = "";
        ramp-capacity-0-foreground = alert;
        ramp-capacity-1 = "";
        ramp-capacity-1-foreground = alert;
        ramp-capacity-2 = "";
        ramp-capacity-3 = "";
        ramp-capacity-4 = "";
      };

      "module/powermenu" = {
        type = "custom/menu";
        expand-right = false;
        expand-left = true;

        format = "<label-toggle> <menu>";
#format-background = secondary;
        format-padding = 1;

        label-open = " ";
        label-close = "";
        label-separator = "  ";

        menu-0-0 = " Suspend";
        menu-0-0-exec = "systemctl suspend";
        menu-0-1 = " Reboot";
        menu-0-1-exec = "reboot";
        menu-0-2 = " Shutdown";
        menu-0-2-exec = "systemctl poweroff";
      };

      "module/filesystem" = {
        type = "internal/fs";
        mount-0 = "/";
        fixed-values = false;
        label-mounted = "󰋊 %used%/%free%";
        label-mounted-font = 2;
        label-mounted-underline = secondary;
      };

      "module/network" = {
        type = "internal/network";
        interface = "enp0s5";
        interval = "3.0";
        label-connected = "󰛴 %downspeed% 󰛶 %upspeed%";
        label-connected-font = 2;
        label-connected-underline = quinary;
        

        label-disconnected = "󰲛 OFFLINE";
        label-disconnected-foreground = alert;
      };

      "settings" = {
        screenchange-reload = true;
        pseudo-transparency = true;
      };
    };
  };
}
