{...}: {
  flake.modules.nixos.system = {
    hardware.bluetooth = {
      enable = true;
      settings = {
        General = {
          Experiemental = true;
        };
      };
    };
  };
}
