{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./keys.nix
    ./waybar
  ];

  options = {
    hyprland.enable = lib.mkEnableOption "enables hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = with config.lib.stylix.colors; {
        general = {
          "col.active_border" = lib.mkForce "rgba(${base06}ff)";
          #"col.inactive_border" = "rgba(${base03}ff)";
          border_size = 3;
          gaps_in = 4;
          gaps_out = 8;
        };

        decoration = {
          rounding = 4;
          rounding_power = 4;

          dim_special = 0.6;

          blur = {
            enabled = false;
          };
          shadow = {
            enabled = false;
          };
        };

        animations = {
          enabled = false;
        };

        cursor = {
          inactive_timeout = 0.5;
        };

        misc = {
          disable_hyprland_logo = true;
          force_default_wallpaper = 0;
          #background_color = "0x${base00}";
        };
        exec-once = "1password --silent";
        windowrulev2 = "noborder,class:(steam_app_200210),title:^((?!Launcher).)*$";
      };
      systemd.variables = ["--all"];
    };
    hyprland.keys.enable = true;
    hyprland.waybar.enable = true;
  };
}
