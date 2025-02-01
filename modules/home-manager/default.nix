{ lib, ... }:
{
    imports = [
        ./hyprland.nix.nix
    ];

    hyprland.enable = lib.mkDefault true;
}
