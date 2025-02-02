{ config, lib, pkgs, inputs, ... }:
{ 
    options = {
        keys.enable = lib.mkEnableOption "enables neovim keymappings";
    };

    config = lib.mkIf config.keys.enable {
        programs.nvf.settings.vim.keymaps = [
            # pickers
            {
                key = "<leader>ff";
                mode = "n";
                lua = true;
                action = "require('mini.pick').builtin.files";
            }
        ];
    };
}
