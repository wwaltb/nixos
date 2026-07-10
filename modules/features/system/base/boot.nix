{...}: {
  flake.modules.nixos.system = {...}: {
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
  };
}
