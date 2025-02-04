{config, lib, pkgs, ...}: {
    options = {
        xdg.enable = lib.mkEnableOption "enables xdg configuration";
    };

    config = lib.mkIf config.xdg.enable {
        xdg.userDirs = {
            enable = true;
            createDirectories = true;
            desktop = "${config.home.homeDirectory}/desktop";
            documents = "${config.home.homeDirectory}/docs";
            download = "${config.home.homeDirectory}/dl";
            music = "${config.home.homeDirectory}/music";
            pictures = "${config.home.homeDirectory}/pics";
            publicShare = "${config.home.homeDirectory}/public";
            templates = "${config.home.homeDirectory}/templates";
            videos = "${config.home.homeDirectory}/videos";

        };
    };
}

