{inputs, ...}: {
  flake.modules.nixos.homeManager = {
    imports = [inputs.home-manager.nixosModules.home-manager];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.walt.config.home.stateVersion = "26.05";
    };
  };
}
