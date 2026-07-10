{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.t14s = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.nixos.t14sConfiguration
    ];
  };

  flake.modules.nixos.t14sConfiguration = {...}: {
    imports = with self.modules.nixos; [
      t14sHardware
      t14sKanata

      discord
      fish
      general
      ghostty
      git
      homeManager
      librewolf
      kanagawa
      neovim
      niri
      noctalia
      powerManagement
      tuigreet
      xdg
    ];

    networking.hostName = "t14s";

    # Enable CUPS to print documents.
    # services.printing.enable = true;

    system.stateVersion = "26.05";
  };
}
