{...}: {
  flake.modules.nixos.fingerprint = {pkgs, ...}: {
    services.fprintd = {
      enable = true;
      tod.enable = true;
      tod.driver = pkgs.libfprint-2-tod1-goodix;
    };
  };
}
