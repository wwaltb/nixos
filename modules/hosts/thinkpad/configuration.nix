{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.thinkpad = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.nixos.thinkpadConfiguration
    ];
  };

  flake.modules.nixos.thinkpadConfiguration = {pkgs, ...}: {
    imports = with self.modules.nixos; [
      thinkpadHardware

      discord
      fish
      general
      ghostty
      git
      homeManager
      librewolf
      kanagawa
      kanata
      neovim
      niri
      noctalia
      powerManagement
      xdg
    ];

    networking.hostName = "thinkpad";

    # Enable CUPS to print documents.
    # services.printing.enable = true;

    system.stateVersion = "26.05";
  };
}
