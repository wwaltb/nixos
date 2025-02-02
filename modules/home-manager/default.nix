{lib, ...}: {
  imports = [
    ./nvim
    ./hypr
  ];

  nvim.enable = lib.mkDefault true;
  hyprland.enable = lib.mkDefault true;
}
