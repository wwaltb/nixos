# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos

    inputs.home-manager.nixosModules.default
    inputs.stylix.nixosModules.stylix
  ];

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-users = ["root" "@wheel"];
  };

  # Use the systemd-boot EFI boot loader
  boot.loader = {
    systemd-boot.enable = true;
    systemd-boot.configurationLimit = 5;
    efi.canTouchEfiVariables = true;
  };

  # Collect nix garbage and optimise the nix store automatically
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d --keep-generations 3";
  };
  nix.optimise.automatic = true;

  # Allow closed source software like nvidia drivers
  nixpkgs.config.allowUnfree = true;

  networking = {
    hostName = "jonsbo6";
    networkmanager.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    openssh.enable = true;
    tailscale.enable = true;
  };

  features = {
    kanagawa.enable = true;
    nvidia.enable = true;
    steam.enable = true;
  };

  programs = {
    fish.enable = true;
    neovim.enable = true;
    hyprland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    git
    wget
    tree
    devenv
    direnv
  ];

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.walt = {
    isNormalUser = true;
    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "networkmanager"
      "dialout"
    ];
    shell = pkgs.fish;
  };

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs;};
    backupFileExtension = "backup";
    users.walt = import ./home.nix;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "24.11"; # Do not change
}
