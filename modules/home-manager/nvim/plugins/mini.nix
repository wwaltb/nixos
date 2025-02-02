{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  options = {
    mini.enable = lib.mkEnableOption "enables mini plugins";
  };

  config = lib.mkIf config.mini.enable {
    programs.nvf.settings.vim.mini = {
      # text editing
      ai.enable = true;
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
      pick.enable = true;
      statusline.enable = true;

      # appearance
      icons.enable = true;

      # misc
    };
  };
}
