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
                extraPlugins = with pkgs.vimPlugins; {

                    kanagawa = {
                        package = kanagawa-nvim;
                        setup = ''
                            require("kanagawa").setup
                            vim.cmd("coloscheme kanagawa")
                        '';
                    };
                };
                theme = {
                    enable = false;
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
            };
        };
    };
}
