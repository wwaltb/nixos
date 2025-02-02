{
config,
lib,
pkgs,
inputs,
...
}: {
    options = {
        blink.enable = lib.mkEnableOption "enables blink completion";
    };

    config = lib.mkIf config.blink.enable {
        programs.nvf.settings.vim.lazy.plugins = with pkgs.vimPlugins; {
            blink = {
                package = blink-cmp;
                setupOpts = {
                    keymap = {
                        preset = "default";
                    };
                    completion = {
                        menu = {
                            border = "single";
                        };
                    };
                    signature = {
                        enabled = true;
                        window = {
                            border = "single";
                        };

                    };
                    sources = {
                        default = [
                            "lsp"
                            "path"
                            "snippets"
                            "buffer"
                        ];
                    };
                };
                after = "friendly-snippets";
            };
            friendly-snippets = {
                package = friendly-snippets;
            };
        };
    };
}
