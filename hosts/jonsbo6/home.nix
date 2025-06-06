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
  ];

  home = {
    username = "walt";
    homeDirectory = "/home/walt";

    packages = with pkgs; [
      ghostty
      pavucontrol
    ];
  };

  programs.ghostty.enable = true;

  colorScheme = inputs.nix-colors.colorSchemes.kanagawa;

  programs.home-manager.enable = true;

  home.stateVersion = "24.11"; # Do not change
}
