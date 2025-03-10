{ config, lib, pkgs, inputs, ... }:
{
  options = {
    cascade.enable = lib.mkEnableOption "enables cascade userChrome";
  };

  config = lib.mkIf config.cascade.enable {
    programs.firefox.profiles.default.userChrome =
      let
        cascade = builtins.fetchGit {
          url = "https://github.com/cascadefox/cascade";
          rev = "8239e304844beb854c068a273f1171f7fadd5212";
        };
      in
      with config.stylix.colors;
      ''
        @import "${cascade}/chrome/includes/cascade-config.css";
        :root {
          /* These colours are (mainly) used by the Container Tabs Plugin */
          --uc-identity-colour-blue: ${base0D};
          --uc-identity-colour-turquoise: ${base0C};
          --uc-identity-colour-green: ${base0B};
          --uc-identity-colour-yellow: ${base0A};
          --uc-identity-colour-orange: ${base09};
          --uc-identity-colour-red: ${base08};
          --uc-identity-colour-pink: ${base0F};
          --uc-identity-colour-purple: ${base0E};

          /*  Cascades main Colour Scheme */
          --uc-base-colour: ${base00};
          --uc-highlight-colour: ${base01};
          --uc-inverted-colour: ${base05};
          --uc-muted-colour: ${base04};
          --uc-accent-colour: var(--uc-identity-colour-purple);
        }
        @import "${toString ./colors.css}";

        @import "${cascade}/chrome/includes/cascade-layout.css";
        @import "${cascade}/chrome/includes/cascade-responsive.css";
        @import "${cascade}/chrome/includes/cascade-floating-panel.css";

        @import "${cascade}/chrome/includes/cascade-nav-bar.css";
        @import "${cascade}/chrome/includes/cascade-tabs.css";
      '';
  };
}

