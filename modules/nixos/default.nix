{ lib, ... }:
{
    imports = [
        ./console.nix
        ./kanagawa.nix
        ./nvidia.nix
    ];
}
