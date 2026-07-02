{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.thinkpad = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.nixos.thinkpadConfiguration
    ];
  };

  flake.modules.nixos.thinkpadConfiguration = {pkgs, ...}: {
    imports = with self.modules.nixos; [
      thinkpadHardware

      kanagawa
      kanata
      neovim
      niri

      homeManager
      ghostty
    ];

    nix.settings.experimental-features = ["nix-command" "flakes"];

    # Use the systemd-boot EFI boot loader.
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

    networking.hostName = "thinkpad";

    # Configure network connections interactively with nmcli or nmtui.
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "America/Los_Angeles";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";
    # console = {
    #   font = "Lat2-Terminus16";
    #   keyMap = "us";
    #   useXkbConfig = true; # use xkb.options in tty.
    # };

    # Enable CUPS to print documents.
    # services.printing.enable = true;

    # Enable sound.
    # services.pulseaudio.enable = true;
    # OR
    # services.pipewire = {
    #   enable = true;
    #   pulse.enable = true;
    # };

    # Define a user account. Don't forget to set a password with ‘passwd’.
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

    # programs.firefox.enable = true;

    environment.systemPackages = with pkgs; [
      wget
      git
    ];

    # Enable the OpenSSH daemon.
    services.openssh.enable = true;
    services.openssh.settings.PasswordAuthentication = false;

    services.tailscale.enable = true;

    system.stateVersion = "26.05";
  };
}
