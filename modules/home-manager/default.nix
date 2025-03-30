{lib, ...}: {
  imports = [
    ./1password
    ./fish
    ./firefox
    ./git
    ./ghostty
    ./hypr
    ./nvim
    ./ripgrep
    ./xdg
  ];

  _1password.enable = lib.mkDefault true;
  fish.enable = lib.mkDefault true;
  firefox.enable = lib.mkDefault true;
  git.enable = lib.mkDefault true;
  ghostty.enable = lib.mkDefault true;
  hyprland.enable = lib.mkDefault true;
  nvim.enable = lib.mkDefault true;
  ripgrep.enable = lib.mkDefault true;
  xdg-dirs.enable = lib.mkDefault true;
}
