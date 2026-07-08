{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.t440p = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.nixos.t440pConfiguration
    ];
  };

  flake.modules.nixos.t440pConfiguration = {pkgs, ...}: {
    imports = with self.modules.nixos; [
      t440pHardware
      t440pKanata

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
      xdg
    ];

    networking.hostName = "t440p";

    # Enable CUPS to print documents.
    # services.printing.enable = true;

    system.stateVersion = "26.05";
  };
}
