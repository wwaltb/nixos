{config, ...}: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
        theme = {
          enable = true;
          name = "base16";
          base16-colors = with config.colorScheme.colors; {
            inherit base00;
            inherit base01;
            inherit base02;
            inherit base03;
            inherit base04;
            inherit base05;
            inherit base06;
            inherit base07;
            inherit base08;
            inherit base09;
            inherit base0A;
            inherit base0B;
            inherit base0C;
            inherit base0D;
            inherit base0E;
            inherit base0F;
          };
        };
        languages = {
          enableLSP = true;
          enableTreesitter = true;

          nix.enable = true;
          clang.enable = true;
        };
        mini = {
          # text editing
          ai.enable = true;
          completion.enable = true;
          surround.enable = true;

          # general workflow
          diff.enable = true;
          files = {
            enable = true;
            setupOpts = {
              mappings = {
                close = "<Esc>";
              };
            };
          };
          git.enable = true;
          statusline.enable = true;

          # appearance
          icons.enable = true;

          # misc
        };
      };
    };
  };
}
