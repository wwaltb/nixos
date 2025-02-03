{ config, lib, pkgs, inputs, ... }:
{ 
    options = {
        cascade.enable = lib.mkEnableOption "enables cascade userChrome";
    };

    config = lib.mkIf config.cascade.enable {
        programs.firefox.userChrome = let
            cascade = builtins.fetchGit {
                url = "https://github.com/cascadefox/cascade";
                ref = "master";

            };
        in ''
            @import "${cascade}/chrome/inlcudes/cascade-config.css";
            @import "${cascade}/chrome/inlcudes/cascade-colours.css";

            @import "${cascade}/chrome/inlcudes/cascade-layout.css";
            @import "${cascade}/chrome/inlcudes/cascade-responsive.css";
            @import "${cascade}/chrome/inlcudes/cascade-floating-panel.css";

            @import "${cascade}/chrome/inlcudes/cascade-nav-bar.css";
            @import "${cascade}/chrome/inlcudes/cascade-tabs.css";
        '';
    };
}

