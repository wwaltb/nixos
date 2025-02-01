{ config, lib, pkgs, inputs, ... }:
{
    imports = [
        # ../../modules/home-manager/default.nix
    ];

    programs.home-manager.enable = true;

    home = {
        username = "walt";
        homeDirectory = "/home/walt";
    };

    packages = with pkgs; [
        nvtopPackages.nvidia
    ];

    home.stateVersion = "24.11"; # Do not change
}
