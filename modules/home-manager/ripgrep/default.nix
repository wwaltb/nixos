{
  config,
  lib,
  ...
}: {
  options = {
    ripgrep.enable = lib.mkEnableOption "ripgrep";
  };

  config = lib.mkIf config.ripgrep.enable {
    programs.ripgrep = {
      enable = true;
      arguments = [
        "--max-columns=160"
        "--max-columns-preview"
        "--hidden"

        "--glob=!.cache/*"
        "--glob=!SteamLibrary/*"
        "--glob=!.steampath/*"
        "--glob=!.steampid/*"
        "--glob=!.wine/*"
        "--glob=!wineprefixes/*"
        "--glob=!Steam/*"
        "--glob=!.steam/*"
      ];
    };
  };
}
