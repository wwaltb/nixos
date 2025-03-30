{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  options = {
    cascade.enable = lib.mkEnableOption "enables cascade userChrome";
  };

  config = lib.mkIf config.cascade.enable {
    programs.firefox.profiles.default.userChrome = let
      cascade = builtins.fetchGit {
        url = "https://github.com/cascadefox/cascade";
        rev = "170db950d2c9709b87a1a233e12655609ffdaf52";
      };
      colors = config.lib.stylix.colors;
    in ''
    '';
  };
}
