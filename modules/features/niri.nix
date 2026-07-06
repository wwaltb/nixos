{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.niri = {
    config,
    lib,
    pkgs,
    ...
  }: {
    programs.niri = {
      enable = true;
      package = inputs.wrapper-modules.wrappers.niri.wrap {
        inherit pkgs;
        settings = {
          spawn-at-startup = [];

          layout = {
            gaps = 6;
            focus-ring.off = _: {};
            border = {
              width = 3;
              active-color = "#${config.lib.stylix.colors.base06}";
              inactive-color = "#${config.lib.stylix.colors.base03}";
            };
            background-color = "#${config.lib.stylix.colors.base00}";

            empty-workspace-above-first = _: {};

            preset-column-widths = [
              {proportion = 0.333333;}
              {proportion = 0.5;}
              {proportion = 0.666667;}
              {proportion = 1.0;}
            ];

            preset-window-heights = [
              {proportion = 0.333333;}
              {proportion = 0.5;}
              {proportion = 0.666667;}
              {proportion = 1.0;}
            ];
          };

          window-rules = [
            {
              matches = [{}];
              geometry-corner-radius = 4.0;
              clip-to-geometry = true;
              draw-border-with-background = false;
            }
          ];

          cursor = {
            hide-after-inactive-ms = 500;
          };

          binds = {
            "Mod+D".close-window = _: {};
            "Mod+Semicolon".spawn-sh = "${lib.getExe pkgs.ghostty} +new-window";
            "Mod+Shift+Semicolon".spawn-sh = lib.getExe pkgs.librewolf;

            "Mod+H".focus-column-or-monitor-left = _: {};
            "Mod+J".focus-window-or-workspace-down = _: {};
            "Mod+K".focus-window-or-workspace-up = _: {};
            "Mod+L".focus-column-or-monitor-right = _: {};

            "Mod+Shift+H".consume-or-expel-window-left = _: {};
            "Mod+Shift+J".move-window-down-or-to-workspace-down = _: {};
            "Mod+Shift+K".move-window-up-or-to-workspace-up = _: {};
            "Mod+Shift+L".consume-or-expel-window-right = _: {};

            "Mod+Shift+Alt+H".switch-preset-column-width-back = _: {};
            "Mod+Shift+Alt+J".switch-preset-window-height-back = _: {};
            "Mod+Shift+Alt+K".switch-preset-window-height = _: {};
            "Mod+Shift+Alt+L".switch-preset-column-width = _: {};
          };

          gestures = {
            hot-corners = {off = _: {};};
          };

          extraConfig = ''
            animations {
              workspace-switch {
                duration-ms 170
                curve "cubic-bezier" 0.767 0.013 0.338 1.077
                // spring damping-ratio=1.0 stiffness=800 epsilon=0.0001
              }
              window-open {
                duration-ms 100
                curve "ease-out-expo"
              }
              window-close {
                duration-ms 100
                curve "cubic-bezier" 0.879 0.032 0.349 0.808
              }
              window-movement {
                duration-ms 170
                curve "cubic-bezier" 0.767 0.013 0.338 1.077
                // spring damping-ratio=2.0 stiffness=1400 epsilon=0.0001
              }
              window-resize {
                off
              }
            }
          '';
        };
      };
    };
  };
}
