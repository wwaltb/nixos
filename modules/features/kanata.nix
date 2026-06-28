{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.kanata = {pkgs, ...}: {
    services.kanata = {
      enable = true;
      keyboards = {
      }
    };
  };
}
