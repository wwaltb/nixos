{lib, ...}: {
  imports = [
    ./firefox
    ./hypr
    ./nvim
  ];

  firefox.enable = lib.mkDefault true;
  hyprland.enable = lib.mkDefault true;
  nvim.enable = lib.mkDefault true;
}
