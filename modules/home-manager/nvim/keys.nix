{ config, lib, pkgs, inputs, ... }:
{ 
    options = {
        nvim-keys.enable = lib.mkEnableOption "enables neovim keymappings";
    };

    config = lib.mkIf config.nvim-keys.enable {
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
