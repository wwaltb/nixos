{ lib, ...}: {
  imports = [
    ./1password
    ./kanagawa.nix
    ./nvidia.nix
  ];

  _1password.enable = lib.mkDefault true;
}
