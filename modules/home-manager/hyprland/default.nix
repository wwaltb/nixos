{
  config,
  lib,
  osConfig,
  ...
}: {
  imports = [
    ./keys.nix
    ./waybar
  ];

  config = lib.mkIf osConfig.features.hyprland.enable {
    # stylix.targets.hyprland.enable = false;
    wayland.windowManager.hyprland = {
      enable = true;
      settings = with config.lib.stylix.colors; {
        config = {
          general = {
            "col.active_border" = lib.mkForce "rgba(${base06}ff)";
            # col.inactive_border = "rgba(${base03}ff)";
            border_size = 3;
            gaps_in = 4;
            gaps_out = 8;
          };

          decoration = {
            rounding = 4;
            rounding_power = 4;

            # dim_special = 0.6;

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
        };

        # not sure if lib.mkIf or lib.optional is correct here, since on can be
        # a list or attribute set?
        on = lib.mkIf osConfig.features._1password.enable {
          _args = [
            "hyprland.start"
            (lib.generators.mkLuaInline "function()\n hl.exec_cmd(\"1password --silent\")\nend")
          ];
        };

        window_rule = {
          name = "steam noborder";
          match.class = "(steam_app_200210)";
          match.title = "^((?!Launcher).)*$";
          border_size = 0;
        };
      };

      configType = "lua";

      systemd.variables = ["--all"];
    };
  };
}
