{ config, pkgs, ... }:

with import ../assets/machines.nix; {
  imports = [ ../hardware/dell-latitude-e6540.nix ./home.nix ];
  environment.etc."resolv.conf" = with pkgs; with lib; {
    source = writeText "resolv.conf" ''
domain home
nameserver 192.168.12.22
nameserver 192.168.12.1
nameserver fe80::327c:b2ff:fec9:4596%br1
options edns0
    '';
  };
  networking = {
    enableIPv6 = false;
    firewall.allowedTCPPorts = [ 3389 2375 7946 9000 80 6443 ];
    firewall.allowPing = true;
  };
  profiles = {
    avahi.enable = true;
    dev.enable = true;
    nix-config.buildCores = 4;
    ssh.enable = true;
    syncthing.enable = true;
  };
  services = {
    logind.lidSwitch = "ignore";
    syncthing-edge.guiAddress = "${wireguard.ips.honshu}:8384";
    wireguard = {
      enable = true;
      ips = [ "${wireguard.ips.honshu}/24" ];
      endpoint = wg.endpointIP;
      endpointPort = wg.listenPort;
      endpointPublicKey = wireguard.kerkouane.publicKey;
    };
  };
}
