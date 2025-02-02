{lib, ...}: {
  imports = [
    ./blink.nix
    ./kanagawa.nix
    ./mini.nix
  ];

  blink.enable = lib.mkDefault true;
  mini.enable = lib.mkDefault true;
}
