{ lib, ... }: {
  imports = [
    ./fish
    ./firefox
    ./git
    ./ghostty
    ./hypr
    ./nvim
    ./ripgrep
    ./tofi
    ./xdg
  ];

  # should probably split this up into gui and tui applications
  fish.enable = lib.mkDefault true;
  firefox.enable = lib.mkDefault true;
  git.enable = lib.mkDefault true;
  ghostty.enable = lib.mkDefault true;
  hyprland.enable = lib.mkDefault true;
  nvim.enable = lib.mkDefault true;
  ripgrep.enable = lib.mkDefault true;
  tofi.enable = lib.mkDefault true;
  xdg-dirs.enable = lib.mkDefault true;
}
