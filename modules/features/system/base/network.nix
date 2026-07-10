{...}: {
  flake.modules.nixos.system = {...}: {
    networking.networkmanager.enable = true;

    services.openssh.enable = true;
    services.openssh.settings.PasswordAuthentication = false;

    services.tailscale.enable = true;
  };
}
