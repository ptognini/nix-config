{ pkgs, ... }:
{
	services.dunst = {
		enable = true;
		settings = {

			global = {
        width = 300;
        height = 300;
        offset = "19x44";
				origin = "top-right";

				browser = "${pkgs.chromium}/bin/chromium -new-tab";
				#dmenu = "${pkgs.rofi}/bin/rofi -dmenu";
				follow = "mouse";
				font = "Roboto Mono Medium 10";
				format = "<b>%s</b>\\n%b";
				frame_color = "#555555";
				frame_width = 1;
				#geometry = "500x5-5+30";
				horizontal_padding = 8;
				icon_position = "left";
				line_height = 0;
				markup = "full";
				padding = 8;
				separator_color = "frame";
				separator_height = 2;
				transparency = 10;
				word_wrap = true;
				icon_theme = "Adwaita";
        enable_recursive_icon_lookup = true;
			};

			urgency_low = {
				background = "#6e6a81";
				foreground = "#4da1af";
				frame_color = "#4da1af";
				timeout = 10;
			};

			urgency_normal = {
				background = "#1f1d2e";
				foreground = "#e0def4";
				frame_color = "#ea9a97";
				timeout = 15;
			};

			urgency_critical = {
				background = "#eb6f92";
				foreground = "#dd5633";
				frame_color = "#dd5633";
				timeout = 0;
			};

		};
	};
}
