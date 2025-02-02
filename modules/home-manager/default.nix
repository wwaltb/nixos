{lib, ...}: {
  imports = [
    ./hypr
    ./nvim
  ];

  hyprland.enable = lib.mkDefault true;
}
