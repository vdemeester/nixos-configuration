{ config, pkgs, ... }:

{
        environment = {
                    systemPackages = with pkgs; [
				compton
				dmenu
				dunst
				emacs
				firefox
				gnome3.defaultIconTheme
				gnome3.gnome_themes_standard
				# adapta-gtk-theme # wait for 16.09 on this one
				i3status
				libnotify
				pythonPackages.udiskie
				termite
				xdg-user-dirs
				xorg.xbacklight
                    ];
        };

	services = {
		xserver = {
			enable = true;
			enableTCP = false;
			vaapiDrivers = [ pkgs.vaapiIntel ];
			synaptics = {
				enable = true;
				twoFingerScroll = true;
				tapButtons = true;
			};
			windowManager = {
				i3 = {
					enable = true;
				};
				default = "i3";
			};
			displayManager = {
				sessionCommands = ''
${pkgs.networkmanagerapplet}/bin/nm-applet &
${pkgs.pythonPackages.udiskie}/bin/udiskie -a -t -n -F &
'';
			};
		};
		unclutter.enable = true;
		redshift = {
			enable = true;
			brightness.day = "0.95";
			brightness.night = "0.7";
			latitude = "48.3";
			longitude = "7.5";
		};
	};

	fonts = {
	      enableFontDir = true;
	      enableGhostscriptFonts = true;
	      fonts = with pkgs; [
	      	    corefonts
		    inconsolata
		    dejavu_fonts
		    ubuntu_font_family
		    unifont
		    google-fonts
		    symbola
		    fira
		    fira-code
		    fira-mono
		    font-droid
	      ];
	};
}
