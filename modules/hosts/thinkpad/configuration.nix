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

      fish
      general
      ghostty
      homeManager
      librewolf
      kanagawa
      kanata
      neovim
      niri
      noctalia
      powerManagement
    ];

    networking.hostName = "thinkpad";

    # Enable CUPS to print documents.
    # services.printing.enable = true;

    system.stateVersion = "26.05";
  };
}
