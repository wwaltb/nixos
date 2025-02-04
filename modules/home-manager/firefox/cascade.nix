{ config, lib, pkgs, inputs, ... }:
{ 
    options = {
        cascade.enable = lib.mkEnableOption "enables cascade userChrome";
    };

    config = lib.mkIf config.cascade.enable {
        programs.firefox.profiles.default.userChrome = let
            cascade = builtins.fetchGit {
                url = "https://github.com/cascadefox/cascade";
                rev = "8239e304844beb854c068a273f1171f7fadd5212";
            };
        in ''
            @import "${cascade}/chrome/includes/cascade-config.css";
            @import "${cascade}/chrome/includes/cascade-colours.css";

            @import "${cascade}/chrome/includes/cascade-layout.css";
            @import "${cascade}/chrome/includes/cascade-responsive.css";
            @import "${cascade}/chrome/includes/cascade-floating-panel.css";

            @import "${cascade}/chrome/includes/cascade-nav-bar.css";
            @import "${cascade}/chrome/includes/cascade-tabs.css";
        '';
    };
}

