{ pkgs, config, lib, ...}:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      gs = "git status";
    };
    shellAliases = import ./aliases.nix;
  };
  xdg.configFile."fish/conf.d/nix-aliases.fish".source = ./fish/nix-aliases.fish;
  xdg.configFile."fish/functions/fish_prompt.fish".source = ./fish/fish_prompt.fish;
  xdg.configFile."fish/functions/fish_right_prompt.fish".source = ./fish/fish_right_prompt.fish;
}