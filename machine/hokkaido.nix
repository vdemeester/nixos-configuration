{ config, pkgs, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
			../hardware-configuration.nix
			../configuration/custom-packages.nix
			../configuration/common.nix
			../hardware/thinkpad-x220.nix
		];

	networking.hostName = "hokkaido";

	services.xserver.displayManager.slim.theme = pkgs.fetchurl {
						url = "https://github.com/vdemeester/slim-themes/raw/master/docker-nuage-theme-0.1.tar.xz";
						sha256 = "127893l1nzqya0g68k8841g5lm3hlnx7b3b3h06axvplc54a1jd8";
						};
}
