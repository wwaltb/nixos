{...}: {
  flake.modules.nixos.system = {
    hardware.bluetooth = {
      enable = true;
    };
  };
}
