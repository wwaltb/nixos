{
  config,
  lib,
  pkgs,
  inputs,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.features.tofi.enable {
    stylix.targets.tofi.enable = false;
    programs.tofi = {
      enable = true;
      settings = with config.lib.stylix.colors; {
        # Text theming #
        font = "${config.stylix.fonts.monospace.package}/share/fonts/opentype/NerdFonts/FiraMono/FiraMonoNerdFont-Regular.otf";
        font-size = config.stylix.fonts.sizes.terminal + 1;

        text-cursor = "true";
        text-cursor-style = "bar";
        text-cursor-thickness = "1";

        text-color = "${base06}";

        selection-color = "${base06}";
        selection-background = "${base03}77";
        selection-background-padding = "0, -1";

        input-color = "${base0D}";
        input-background = "${base01}";
        input-background-padding = "0, 0, 8, 0";

        prompt-text = "> ";
        prompt-color = "${base0D}";
        prompt-padding = "8";
        prompt-background = "${base01}";
        prompt-background-padding = "0, 8";

        # Window theming #
        width = "30%";
        height = "50%";
        background-color = "${base00}";

        outline-width = "6";
        outline-color = "${base00}";
        border-width = "1";
        border-color = "${base03}";

        padding-top = "0";
        padding-bottom = "0";
        padding-left = "0";
        padding-right = "0";

        # Behaviour #
        matching-algorithm = "fuzzy";
        late-keyboard-init = "true";
      };
    };
  };
}
