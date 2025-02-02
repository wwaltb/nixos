{
config,
lib,
pkgs,
inputs,
...
}: {
    options = {
        completion.enable = lib.mkEnableOption "enables completion";
    };

    config = lib.mkIf config.completion.enable {
        programs.nvf.settings.vim.autocomplete.nvim-cmp = {
            enable = true;
            mappings = {
                close = "<C-h";
                next = "<C-j";
                previous = "<C-k";
                complete = "<C-l";
                scrollDocsUp = "<C-u";
                scrollDocsDown = "<C-d";
            };
        };
        programs.nvf.settings.vim.ui.borders.plugins.nvim-cmp = {
            enable = true;
            style = "single";
        };
    };
}
