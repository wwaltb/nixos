{
  inputs,
  self,
  ...
}: {
  flake.modules.nixos.discord = {
    home-manager.users.walt.imports = [
      inputs.nixcord.homeModules.nixcord
      self.modules.homeManager.discord
    ];
  };

  flake.modules.homeManager.discord = {...}: {
    programs.nixcord = {
      enable = true;
      discord = {
        krisp.enable = true;
      };

      legcord = {
        enable = true;
        vencord.enable = true;
        settings = {
          mods = ["vencord"];
          hardwareAcceleration = true;
        };
      };
    };
  };
}
