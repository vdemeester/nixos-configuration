{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
in
rec {
  ape = import ./ape {
    inherit (pkgs) stdenv lib buildGoPackage fetchFromGitHub;
  };
  vrsync = import ./vrsync {
    inherit (pkgs) stdenv lib;
  };
  vde-thinkpad = import ./vde-thinkpad {
    inherit (pkgs) stdenv lib;
  };
  cni = import ./cni {
    inherit (pkgs) stdenv fetchFromGitHub go;
  };
  cni-plugins = import ./cni/plugins.nix {
    inherit (pkgs) stdenv lib fetchFromGitHub go;
  };
  stellar = import ./stellar {
    inherit (pkgs) stdenv lib fetchFromGitHub removeReferencesTo go;
  };
}
