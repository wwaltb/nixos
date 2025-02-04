{lib, ...}: {
    imports = [
        ./firefox
        ./hypr
        ./nvim
        ./xdg.nix
    ];

    firefox.enable = lib.mkDefault true;
    hyprland.enable = lib.mkDefault true;
    nvim.enable = lib.mkDefault true;
    xdg-conf.enable = lib.mkDefault true;
}
