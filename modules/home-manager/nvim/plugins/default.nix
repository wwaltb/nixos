{lib, ...}: {
  imports = [
    ./mini.nix
  ];

  mini.enable = lib.mkDefault true;
}
