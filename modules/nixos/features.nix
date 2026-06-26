{lib, ...}: {
  options.features = {
    # nixOS
    _1password.enable = lib.mkEnableOption "_1password";
    kanagawa.enable = lib.mkEnableOption "kanagawa stylix theme";
    nvidia.enable = lib.mkEnableOption "nvidia";
    steam.enable = lib.mkEnableOption "steam";

    # home manager
    discord.enable = lib.mkEnableOption "discord";
    firefox.enable = lib.mkEnableOption "firefox";
    fish.enable = lib.mkEnableOption "fish";
    ghostty.enable = lib.mkEnableOption "ghostty";
    git.enable = lib.mkEnableOption "git";
    hyprland.enable = lib.mkEnableOption "hyprland";
    hyprland.waybar.enable = lib.mkEnableOption "waybar for hyprland";
    nvim.enable = lib.mkEnableOption "nvim";
    ripgrep.enable = lib.mkEnableOption "ripgrep";
    rmpc.enable = lib.mkEnableOption "rmpc";
    tofi.enable = lib.mkEnableOption "tofi";
    xdg-dirs.enable = lib.mkEnableOption "xdg directories";
  };

  config.features = {
    # nixOS
    _1password.enable = lib.mkDefault true;
    kanagawa.enable = lib.mkDefault true;

    # home manager
    discord.enable = lib.mkDefault true;
    firefox.enable = lib.mkDefault true;
    fish.enable = lib.mkDefault true;
    ghostty.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
    hyprland.enable = lib.mkDefault true;
    hyprland.waybar.enable = lib.mkDefault true;
    nvim.enable = lib.mkDefault true;
    ripgrep.enable = lib.mkDefault true;
    rmpc.enable = lib.mkDefault true;
    tofi.enable = lib.mkDefault true;
    xdg-dirs.enable = lib.mkDefault true;
  };
}
