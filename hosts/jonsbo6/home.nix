{
config,
lib,
pkgs,
inputs,
...
}: {
    imports = [
        ../../modules/home-manager/default.nix
        inputs.nix-colors.homeManagerModules.default
        inputs.nvf.homeManagerModules.default
    ];

    home = {
        username = "walt";
        homeDirectory = "/home/walt";

        packages = with pkgs; [
            ghostty
        ];
    };

    programs.ghostty.enable = true;

    colorScheme = inputs.nix-colors.colorSchemes.kanagawa;

    programs.home-manager.enable = true;

    home.stateVersion = "24.11"; # Do not change
}
