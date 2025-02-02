{ config, lib, pkgs, inputs, ... }:
{ 
    options = {
        mini.enable = lib.mkEnableOption "enables mini plugin";
    };

    config = lib.mkIf config.keys.enable {
        programs.nvf.settings.vim.mini = {
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
}
