{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../modules/home-manager/default.nix
    inputs.nix-colors.homeManagerModules.default
    inputs.nixcord.homeModules.nixcord
  ];

  home = {
    username = "walt";
    homeDirectory = "/home/walt";

    packages = with pkgs; [
      pavucontrol
    ];
  };

  colorScheme = inputs.nix-colors.colorSchemes.kanagawa;

  programs.home-manager.enable = true;

  home.stateVersion = "24.11"; # Do not change
}
