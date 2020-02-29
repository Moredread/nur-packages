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

  airnef = pkgs.callPackage ./pkgs/airnef {
    pythonPackages =
      pkgs.python3Packages;
    buildPythonApplication =
      pkgs.python3Packages.buildPythonApplication;
  };

  nmigen = pkgs.callPackage ./pkgs/nmigen {};
  nmigen-boards = pkgs.callPackage ./pkgs/nmigen-boards { nmigen = nmigen; };

  cc-tool = pkgs.callPackage ./pkgs/cc-tool {};
  ipbt = pkgs.callPackage ./pkgs/ipbt {};
  implicitcad = pkgs.haskellPackages.callPackage ./pkgs/implicitcad {};
  nix-search = pkgs.callPackage ./pkgs/nix-search {};
  prusa-slicer-latest = pkgs.callPackage ./pkgs/prusa-slicer-latest { cereal = pkgs.callPackage ./pkgs/cereal {}; };
  slic3r-prusa3d-latest = prusa-slicer-latest;
}
