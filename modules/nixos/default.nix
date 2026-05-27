{lib, ...}: {
  imports = [
    ./1password
    ./features.nix
    ./kanagawa.nix
    ./nvidia.nix
    ./steam.nix
  ];
}
