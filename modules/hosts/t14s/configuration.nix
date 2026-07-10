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
      # t14s modules
      t14sDolbySound
      t14sHardware
      t14sKanata

      # system modules
      system
      homeManager
      powerManagement
      tuigreet

      # terminal modules
      fish
      git
      neovim

      # desktop modules
      discord
      ghostty
      librewolf
      niri
      noctalia

      # theme
      kanagawa
    ];

    networking.hostName = "t14s";

    # Enable CUPS to print documents.
    # services.printing.enable = true;

    system.stateVersion = "26.05";
  };
}
