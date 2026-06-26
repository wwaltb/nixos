{
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.features.discord.enable {
    programs.nixcord = {
      enable = true;
      discord = {
        krisp.enable = true;
      };

      legcord = {
        enable = true;
        vencord.enable = true;
        settings = {
          mods = ["vencord"];
          hardwareAcceleration = true;
        };
      };
    };
  };
}
