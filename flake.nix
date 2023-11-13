{
	description = "Nixos setup for development";

	inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = inputs @ {
		self, 
		nixpkgs,
		home-manager,
		nix-index-database,
		...
		}: {
        nixosConfigurations = let
          userDetails = {
            fullName = "Andre Aragao";
            userName = "aragao"; # this is going to be used for both linux user creation and git, so I recommend using global login name
            email = "aragao@avaya.com"; # this is going to be used for git
          };
          desktopDetails = {
            dpi = 192;
          };
        in {
#TODO: AVOID THE REPETITION  
          prl-dev = nixpkgs.lib.nixosSystem rec{
            system = "aarch_64-linux";
            specialArgs = {
              inherit (nixpkgs) lib;
              inherit inputs nixpkgs;
              inherit system;
              inherit userDetails;
              inherit desktopDetails;
            };

            modules = [
              inputs.home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  users.${userDetails.userName} = {
                    home = {
                      username = "${userDetails.userName}";
                      homeDirectory = "/home/${userDetails.userName}";
                      # do not change this value
                      stateVersion = "23.11";
                    };

                    # Let Home Manager install and manage itself.
                    programs.home-manager.enable = true;
                  };
                  # make root great again
 							    users.root = { pkgs, ...}:{
								    home.username = "root";
								    home.homeDirectory = "/root";
								    home.stateVersion = "23.11";
								    programs.home-manager.enable = true;
								    imports = [
									    ./home/nvim.nix
									    ./home/shell.nix
								    ];
								  };
                };
              }
              ./machines/prl-dev
              ./system
              ./home
              nix-index-database.nixosModules.nix-index #https://github.com/nix-community/nix-index-database
            ];
          };

          utm-dev = nixpkgs.lib.nixosSystem rec{
            system = "aarch_64-linux";
            specialArgs = {
              inherit (nixpkgs) lib;
              inherit inputs nixpkgs;
              inherit system;
              inherit userDetails;
              inherit desktopDetails;
            };

            modules = [
              inputs.home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  users.${userDetails.userName} = {
                    home = {
                      username = "${userDetails.userName}";
                      homeDirectory = "/home/${userDetails.userName}";
                      # do not change this value
                      stateVersion = "23.11";
                    };

                    # Let Home Manager install and manage itself.
                    programs.home-manager.enable = true;
                  };
                  # make root great again
 							    users.root = { pkgs, ...}:{
								    home.username = "root";
								    home.homeDirectory = "/root";
								    home.stateVersion = "23.11";
								    programs.home-manager.enable = true;
								    imports = [
									    ./home/nvim.nix
									    ./home/shell.nix
								    ];
								  };
                };
              }
              ./machines/utm-dev
              ./system
              ./home
              nix-index-database.nixosModules.nix-index #https://github.com/nix-community/nix-index-database
            ];
          };
        };
  };
}  
        
#		};
# };
#      let 
#        system="aarch_64-linux";
#        pkgs = 
#          import nixpkgs {
#
#          };
#        homeManagerWithArgs = {home-manager.extraSpecialArgs = inputs // { inherit gtk-nix; }; };
#	in	{
#			nixosConfigurations = {
#				nixos-dev = nixpkgs.lib.nixosSystem {
#				  specialArgs = {inherit inputs gtk-nix; };
#				  system = "aarch_64-linux";
#					modules = [
#						./configuration.nix
#						home-manager.nixosModules.home-manager homeManagerWithArgs
#						{
#						  
#							home-manager.useGlobalPkgs = true;
#							home-manager.useUserPackages = true;
#							home-manager.users.aragao = { pkgs, gtk-nix, ... }:{
#								home.username  = "aragao";
#								home.homeDirectory = "/home/aragao";
#								
#								programs = {
#									home-manager.enable = true;
#									command-not-found.enable = false;
#								};
#								imports = [
#									./i3.nix
#									./rofi.nix
#									./alacritty.nix
#									./packages.nix
#									./polybar-basic.nix
#									./picom.nix
#									./redshift.nix
#									./vscode.nix
#									./shell.nix
#									./chromium.nix
#									./gtk.nix
#									./nvim.nix
#									./git.nix
#									./xdg.nix
#									./xresources.nix
#									./screen-capture.nix
#								];
#                home.keyboard.options = [
#                  "ctrl:nocaps"
#                ];
#                xsession.enable = true;								
#								home.sessionPath = [
#									"$HOME/.local/bin"
#								];
#								
#								home.sessionVariables = { 
#                  JAVAX_NET_SSL_TRUSTSTORE = "$HOME/.config/java-cacerts";
#								};
#
#								home.stateVersion = "23.11";
#							};
#
#							home-manager.users.root = { pkgs, ...}:{
#								home.username = "root";
#								home.homeDirectory = "/root";
#								imports = [
#									./nvim.nix
#									./shell.nix
#								];
#								home.stateVersion = "23.11";
#							};
#						}
#					];
#				};
#			};
#		};
#}
