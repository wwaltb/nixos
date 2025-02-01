# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:
{
    imports = [
        ./hardware-configuration.nix
        inputs.home-manager.nixosModules.default
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Use the systemd-boot EFI boot loader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    nvidia.enable = true;

    networking.hostName = "jonsbo6"; # Define your hostname.
    networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Set your time zone.
    time.timeZone = "America/Los_Angeles";

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
        font = "Lat2-Terminus16";
        keyMap = "us";
        useXkbConfig = true; # use xkb.options in tty.
    };

    # nixpkgs.config.allowUnfree = true;
    # hardware.graphics = {
    #     enable = true;
    # };
    # services.xserver.videoDrivers = ["nvidia"];
    # hardware.nvidia = {
    #     modesetting.enable = true;
    #     powerManagement.enable = false;
    #     powerManagement.finegrained = false;
    #     open = false;
    #     nvidiaSettings = true;
    #     package = config.boot.kernelPackages.nvidiaPackages.stable;
    # };



    # Configure keymap in X11
    # services.xserver.xkb.layout = "us";
    # services.xserver.xkb.options = "eurosign:e,caps:escape";

    # Enable CUPS to print documents.
    # services.printing.enable = true;

    # Enable sound.
    # hardware.pulseaudio.enable = true;
    # OR
    services.pipewire = {
        enable = true;
        pulse.enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # services.libinput.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.walt = {
        isNormalUser = true;
        extraGroups = [
            "wheel" # Enable ‘sudo’ for the user.
            "networkmanager"
        ];
        packages = with pkgs; [
            tree
        ];
    };

    home-manager = {
        extraSpecialArgs = { inherit inputs; };
        users.walt = import ./home.nix;
    };

    programs.firefox.enable = true;
    programs.hyprland.enable = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        git
        wget
        kitty
        neovim
    ];

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    services.openssh.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    # Copy the NixOS configuration file and link it from the resulting system
    # (/run/current-system/configuration.nix). This is useful in case you
    # accidentally delete configuration.nix.
    # system.copySystemConfiguration = true;

    system.stateVersion = "24.11"; # Do not change

}

