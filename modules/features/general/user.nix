{...}: {
  flake.modules.nixos.general = {
    config,
    pkgs,
    ...
  }: {
    users.users.walt = {
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager"]; # Enable ‘sudo’ for the user.
      packages = with pkgs; [
        tree
      ];

      openssh.authorizedKeys.keys = [
        "ssh-ed25519
        AAAAC3NzaC1lZDI1NTE5AAAAIAxBwwcZ/KwY7UdVxk9vihml3+uFWAhy+c8mmT4qMGP+
        walt@jonsbo6"
      ];
    };

    xdg.userDirs = {
      enable = true;
      createDirectories = true;
      setSessionVariables = false;
      desktop = "${config.home.homeDirectory}/desktop";
      documents = "${config.home.homeDirectory}/documents";
      download = "${config.home.homeDirectory}/downloads";
      music = "${config.home.homeDirectory}/music";
      pictures = "${config.home.homeDirectory}/pictures";
      projects = "${config.home.homeDirectory}/projects";
      publicShare = "${config.home.homeDirectory}/public";
      templates = "${config.home.homeDirectory}/templates";
      videos = "${config.home.homeDirectory}/videos";
    };
  };
}
