{
  config,
  lib,
  pkgs,
  inputs,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.features.hyprland.enable {
    wayland.windowManager.hyprland = {
      settings = {
        bind =
          [
            ## window management ##

            # close window
            {
              _args = [
                "SUPER + D"
                (lib.generators.mkLuaInline "hl.dsp.window.close()")
              ];
            }
            {
              _args = [
                "SUPER + F"
                (lib.generators.mkLuaInline "hl.dsp.window.fullscreen()")
              ];
            }

            # navigate windows
            {
              _args = [
                "SUPER + H"
                (lib.generators.mkLuaInline "hl.dsp.focus({direction = \"l\"})")
              ];
            }
            {
              _args = [
                "SUPER + J"
                (lib.generators.mkLuaInline "hl.dsp.focus({direction = \"d\"})")
              ];
            }
            {
              _args = [
                "SUPER + K"
                (lib.generators.mkLuaInline "hl.dsp.focus({direction = \"u\"})")
              ];
            }
            {
              _args = [
                "SUPER + L"
                (lib.generators.mkLuaInline "hl.dsp.focus({direction = \"r\"})")
              ];
            }

            ## workspace management ##

            {
              _args = [
                "SUPER + CTRL + H"
                (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"-1\"})")
              ];
            }
            {
              _args = [
                "SUPER + CTRL + L"
                (lib.generators.mkLuaInline "hl.dsp.focus({workspace = \"+1\"})")
              ];
            }

            # "super, v, togglefloating"

            ## misc ##

            # exit hyprland
            {
              _args = [
                "SUPER + SHIFT + M"
                (lib.generators.mkLuaInline "hl.dsp.exit()")
              ];
            }
          ]
          ## module enabled binds ##
          # tofi
          ++ lib.optionals osConfig.features.tofi.enable [
            {
              _args = [
                "SUPER + SPACE"
                (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"tofi-drun --drun-launch=true\")")
              ];
            }
          ]
          # 1password
          ++ lib.optionals osConfig.features._1password.enable [
            {
              _args = [
                "SUPER + P"
                (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"1password  --quick-access\")")
              ];
            }
            {
              _args = [
                "SUPER + SHIFT + P"
                (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"1password  --toggle\")")
              ];
            }
          ]
          # ghostty
          ++ lib.optional osConfig.features.ghostty.enable
          {
            _args = [
              "SUPER + code:47"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"ghostty\")")
            ];
          }
          # firefox
          ++ lib.optional osConfig.features.firefox.enable
          {
            _args = [
              "SUPER + SHIFT + code:47"
              (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"firefox\")")
            ];
          };
        # ++ (
        #   builtins.concatLists (builtins.genList (
        #       i: let
        #         ws = i + 1;
        #       in [
        #         "super, code:1${toString i}, workspace, ${toString ws}"
        #         "super shift, code:1${toString i}, movetoworkspace, ${toString ws}"
        #       ]
        #     )
        #     9)
        # );
      };
    };
  };
}
