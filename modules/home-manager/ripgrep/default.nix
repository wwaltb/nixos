{
  config,
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.features.ripgrep.enable {
    programs.ripgrep = {
      enable = true;
      arguments = [
        "--max-columns=160"
        "--max-columns-preview"
        "--hidden"

        "--glob=!.git/*"

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
