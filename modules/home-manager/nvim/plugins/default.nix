{lib, ...}: {
  imports = [
    ./completion.nix
    ./kanagawa.nix
    ./mini.nix
  ];

  completion.enable = lib.mkDefault true;
  mini.enable = lib.mkDefault true;
}
