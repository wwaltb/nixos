{
config,
lib,
pkgs,
inputs,
...
}: {
    options = {
        kanagawa-nvim.enable = lib.mkEnableOption "enables the kanagawa neovim colorscheme";
    };

    config = lib.mkIf config.kanagawa-nvim.enable {
        programs.nvf.settings.vim.extraPlugins = with pkgs.vimPlugins; {

            kanagawa = {
                package = kanagawa-nvim;
                setup = ''
                    require("kanagawa").setup({
                        colors = {
                            theme = { all = { ui = { bg_gutter = "none", }, }, },
                        },
                        overrides = function(colors)
                            local theme = colors.theme
                            return {
                                NormalFloat = { bg = "none" },
                                FloatBorder = { bg = "none" },
                                FloatTitle = { bg = "none" },

                                -- Save an hlgroup with dark background and dimmed foreground
                                -- so that you can use it where your still want darker windows.
                                -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
                                NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

                                -- Popular plugins that open floats will link to NormalFloat by default;
                                -- set their background accordingly if you wish to keep them dark and borderless
                                LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                                MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                            }
                        end, 
                    })
                    vim.cmd("colorscheme kanagawa")
                '';
            };
        };
    };
}
