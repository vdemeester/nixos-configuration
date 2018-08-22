{ pkgs, prefix, ... }:

{
  imports = [ ./dev.nix ];
  home.file.".npmrc".text = ''
    prefix = ~/.local/npm
  '';
  xdg.configFile."fish/conf.d/js.fish".text = ''
    set -gx PATH $HOME/.local/npm/bin $PATH
  '';
  home.packages = with pkgs; [
    nodejs-9_x
    yarn
  ];
}