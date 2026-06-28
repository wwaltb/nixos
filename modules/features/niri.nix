{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.niri = {pkgs, ...}: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };

  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        spawn-at-startup = [
        ];

        layout = {
          gaps = 8; # gaps_out equivalent
          focus-ring.off = null; # niri separates focus-ring vs border; Hyprland's "border" maps to niri's "border", not focus-ring
          border = {
            width = 3; # border_size
            # "active-color" = "#${colors.base06}";
            # "inactive-color" = "#${colors.base03}";
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
        };
      };
    };
  };
}
