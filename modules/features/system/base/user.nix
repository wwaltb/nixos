{...}: {
  flake.modules.nixos.system = {pkgs, ...}: {
    users.users.walt = {
      isNormalUser = true;

      extraGroups = ["wheel" "networkmanager"]; # Enable ‘sudo’ for the user.
      packages = with pkgs; [
        tree
      ];

      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAxBwwcZ/KwY7UdVxk9vihml3+uFWAhy+c8mmT4qMGP+ walt@jonsbo6"
      ];
    };
  };
}
