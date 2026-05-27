{
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.features.ghostty.enable {
    programs.ghostty = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        window-decoration = false;
        window-padding-x = "4";
        window-padding-y = "4";
        resize-overlay = "never";
        working-directory = "home";
      };
    };
  };
}
