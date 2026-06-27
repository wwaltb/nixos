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
          gaps = 4;
          border = {
            width = 3;
          };
        };

        binds = {
          "Mod+D".close-window = _: { };
          "Mod+Semicolon".spawn-sh = lib.getExe pkgs.ghostty;
          "Mod+Shift+Semicolon".spawn-sh = lib.getExe pkgs.firefox;
        };
      };
    };
  };
}
