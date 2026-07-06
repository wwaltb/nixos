{...}: {
  flake.modules.nixos.general = {pkgs, ...}: {
    nix.settings.experimental-features = ["nix-command" "flakes"];

    environment.systemPackages = with pkgs; [
      wget
      git
    ];

    networking.networkmanager.enable = true;
  };
}
