{config, lib, pkgs, ...}: {
    imports = [
        ./plugins
        ./keys.nix
    ];

    options = {
        nvim.enable = lib.mkEnableOption "enables neovim";
    };

    config = lib.mkIf config.nvim.enable {
        programs.nvf = {
            enable = true;
            settings.vim = {
                viAlias = true;
                vimAlias = true;
                lsp = {
                };
                languages = {
                    enableLSP = true;
                    enableTreesitter = true;

                    nix.enable = true;
                    clang.enable = true;
                };
                binds = {
                    whichKey = {
                        enable = true;
                        setupOpts.win.border = "single";
                    };
                };
            };
        };
        kanagawa.enable = true;
        nvim-keys.enable = true;
    };
}
