{lib, ...}: {
  imports = [
    ./1password
    ./kanagawa.nix
    ./nvidia.nix
    ./steam.nix
  ];

  _1password.enable = lib.mkDefault true;
}
