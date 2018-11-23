{ pkgs, lib, ... }:

{
  imports = [
    ./profiles/avahi.nix
    ./profiles/buildkit.nix
    ./profiles/fish.nix
    ./profiles/containerd.nix
    ./profiles/desktop.nix
    ./profiles/dev.nix
    ./profiles/docker.nix
    ./profiles/git.nix
    ./profiles/i18n.nix
    ./profiles/laptop.nix
    ./profiles/nix-config.nix
    ./profiles/nix-auto-update.nix
    ./profiles/printing.nix
    ./profiles/pulseaudio.nix
    ./profiles/scanning.nix
    ./profiles/ssh.nix
    ./profiles/syncthing.nix
    ./profiles/users.nix
    ./profiles/virtualization.nix
    ./programs/podman.nix
    ./services/syncthing.nix
    ./services/wireguard.client.nix
    ./virtualisation/buildkit.nix
    ./virtualisation/containerd.nix
    ./virtualisation/docker.nix
  ];
}
