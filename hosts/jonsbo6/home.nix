{ config, lib, pkgs, inputs, ... }:
{
    imports = [
        ../../modules/home-manager/default.nix
        inputs.nix-colors.homeManagerModules.default
    ];

    programs.home-manager.enable = true;

    home = {
        username = "walt";
        homeDirectory = "/home/walt";

	packages = with pkgs; [
	];
    };


    colorScheme = inputs.nix-colors.colorSchemes.kanagawa;

    home.stateVersion = "24.11"; # Do not change
}
