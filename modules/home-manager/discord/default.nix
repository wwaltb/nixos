{
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.features.discord.enable {
    programs.nixcord.legcord = {
      enable = true;
      vencord.enable = true;
      settings = {
        mods = ["vencord"];
      };
    };
  };
}
