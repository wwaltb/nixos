{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.niri = { config, lib, pkgs, ...}: {
    programs.niri = {
      enable = true;
      package = inputs.wrapper-modules.wrappers.niri.wrap {
        inherit pkgs;
        settings = {
          spawn-at-startup = [
          ];

          layout = {
            gaps = 8;
            focus-ring.off = _: {}; 
            border = {
              width = 3;
              "active-color" = "#${config.lib.stylix.colors.base06}";
              "inactive-color" = "#${config.lib.stylix.colors.base03}";
            };
          };

          window-rules = [
            {
              matches = [{}];
              geometry-corner-radius = 4.0;
              "clip-to-geometry" = true;
            }
          ];

          cursor = {
            "hide-after-inactive-ms" = 500;
          };

          binds = {
            "Mod+D".close-window = _: {};
            "Mod+Semicolon".spawn-sh = lib.getExe pkgs.ghostty;
            "Mod+Shift+Semicolon".spawn-sh = lib.getExe pkgs.firefox;

            "Mod+H".focus-column-left = _: {};
            "Mod+J".focus-window-down = _: {};
            "Mod+K".focus-window-up = _: {};
            "Mod+L".focus-column-right = _: {};
          };
        };
      };
    };
  };
}
