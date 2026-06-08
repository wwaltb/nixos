{
  config,
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.features.fish.enable {
    programs.fish = {
      enable = true;
      shellInit = with config.lib.stylix.colors; ''
        set -g fish_color_autosuggestion ${base04}
        set -g fish_color_command ${base0C}
        set -g fish_color_param ${base0E}
        set -g fish_color_error ${base0F}
        set -g fish_color_comment ${base04}

      '';
      interactiveShellInit = ''
        set -g fish_greeting
      '';
    };

    programs.direnv.enableFishIntegration = true;
  };
}
