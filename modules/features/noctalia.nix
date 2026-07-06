{
  inputs,
  self,
  ...
}: {
  flake.modules.nixos.noctalia = {
    imports = [
      inputs.noctalia.nixosModules.default
    ];
    home-manager.users.walt.imports = [
      inputs.noctalia.homeModules.default
      self.modules.homeManager.noctalia
    ];

    # programs.noctalia.recommendedServices.enable = true;
    services.upower.enable = true;
  };

  flake.modules.homeManager.noctalia = {
    programs.noctalia = {
      enable = true;
      settings = {
        theme = {
          mode = "dark";
          source = "builtin";
          builtin = "Kanagawa";
        };
      };
    };
  };
}
