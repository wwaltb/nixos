{ lib, ... }: {
  imports = [
    ./firefox
    ./ghostty
    ./hypr
    ./nvim
    ./xdg
  ];

  fish.enable = lib.mkDefault true;
  firefox.enable = lib.mkDefault true;
  ghostty.enable = lib.mkDefault true;
  hyprland.enable = lib.mkDefault true;
  nvim.enable = lib.mkDefault true;
  xdg-dirs.enable = lib.mkDefault true;
}
