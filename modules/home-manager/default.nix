{ lib, ... }:
{
    imports = [
        ./hypr
    ];

    hyprland.enable = lib.mkDefault true;
}
