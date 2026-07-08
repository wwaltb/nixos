{...}: {
  flake.modules.nixos.general = {pkgs, ...}: {
    nix.settings.experimental-features = ["nix-command" "flakes"];
    nixpkgs.config.allowUnfree = true;

    boot.loader = {
      efi.canTouchEfiVariables = true;

      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        gfxmodeEfi = "1920x1080";
        # gfxpayloadEfi = "text";
      };

      systemd-boot.enable = false;
    };

    environment.systemPackages = with pkgs; [
      wget
      git
    ];
  };
}
