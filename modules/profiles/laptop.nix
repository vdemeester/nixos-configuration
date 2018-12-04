{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.profiles.laptop;
in
{
  options = {
    profiles.laptop = {
      enable = mkOption {
        default = false;
        description = "Enable laptop profile";
        type = types.bool;
      };
    };
  };
  config = mkIf cfg.enable {
    profiles.desktop.enable = true;
    environment.systemPackages = with pkgs; [
      lm_sensors
      powertop
      acpi
    ];
  };
}