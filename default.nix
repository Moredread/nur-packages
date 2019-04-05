# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> {} }:

rec {
  # The `lib`, `modules`, and `overlay` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  croc = pkgs.callPackage ./pkgs/croc { };
  i3status-rust = pkgs.callPackage ./pkgs/i3status-rust { };
  implicitcad = pkgs.haskellPackages.callPackage ./pkgs/implicitcad { };
  latte = pkgs.callPackage ./pkgs/latte { };
  nix-search = pkgs.callPackage ./pkgs/nix-search { };
  throttled = pkgs.callPackage ./pkgs/throttled { };
  lenovo-throttling-fix = throttled;
  slic3r-prusa3d-latest = pkgs.callPackage ./pkgs/slic3r-prusa3d { };
}

