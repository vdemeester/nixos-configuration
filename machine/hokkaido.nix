{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ../hardware-configuration.nix
    ../profiles/laptop.nix
    ../profiles/ssh.nix
    ../profiles/yubikey.nix
    ../profiles/dev.nix
    ../profiles/containerd.nix
    ../profiles/buildkitd.nix
    ../profiles/wireguard.nix
    ../service/wireguard.client.nix
    ../location/home.nix
    ../hardware/thinkpad-x220.nix
  ];

  boot.loader.efi.canTouchEfiVariables = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.trackpoint.enable = false;
  time.timeZone = "Europe/Paris";

  environment.systemPackages = with pkgs; [
    nfs-utils
    sshfs
  ];

  services.autofs = {
    enable = true;
    debug = false;
    autoMaster = let
      mapConfSsh = pkgs.writeText "auto.sshfs"  ''
      shikoku.local -fstype=fuse,allow_other :sshfs\#shikoku.local\:
      '';
      mapConf = pkgs.writeText "auto"  ''
      synodine -fstype=nfs,rw 192.168.12.19:/
      '';
    in ''
      /auto file:${mapConf}
      /auto/sshfs file:${mapConfSsh} uid=1000,gid=100,--timeout=30,--ghost
    '';
  };

  services.xserver.displayManager.slim.theme = pkgs.fetchurl {
    url = "https://github.com/vdemeester/slim-themes/raw/master/docker-key-theme-0.1.tar.xz";
    sha256 = "127893l1nzqya0g68k8841g5lm3hlnx7b3b3h06axvplc54a1jd8";
  };

  services.wireguard = with import ../assets/wireguard.nix; {
    enable = true;
    ips = [ "${ips.hokkaido}/24" ];
    endpoint = main.endpointIP;
    endpointPort = main.listenPort;
    endpointPublicKey = kerkouane.publicKey;
  };
}
