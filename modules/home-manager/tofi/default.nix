{ config
, lib
, pkgs
, inputs
, ...
}: {
  options = {
    tofi.enable = lib.mkEnableOption "tofi config";
  };

  config = lib.mkIf config.tofi.enable {
    programs.tofi = {
      enable = true;
      settings = {
        # Text theming #
        prompt-text = "> ";
        text-cursor-style = "bar";
        text-cursor-thickness = "1";

        text-color = "#c8c093";

        selection-color = "#c8c093";
        selection-background = "#54546d77";
        selection-background-padding = "0, -1";

        input-color = "#7E9CD8";
        input-background = "#16161D";
        input-background-padding = "0, 10";
        prompt-color = "#7E9CD8";
        prompt-background = "#16161D";
        prompt-background-padding = "0, 22";

        # Window theming #
        width = "30%";
        height = "50%";
        background-color = "#1f1f28";

        outline-width = "4";
        outline-color = "#1f1f28";
        border-width = "1";
        border-color = "#54546d";

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
