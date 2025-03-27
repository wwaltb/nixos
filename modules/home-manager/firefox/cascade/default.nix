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
          rev = "170db950d2c9709b87a1a233e12655609ffdaf52";
        };
	colors = config.lib.stylix.colors;
      in
      ''
        /* @import "${toString ./config.css}";
        // :root {
        //   /* These colours are (mainly) used by the Container Tabs Plugin */
        //   --uc-identity-colour-blue: #${colors.base0D};
        //   --uc-identity-colour-turquoise: #${colors.base0C};
        //   --uc-identity-colour-green: #${colors.base0B};
        //   --uc-identity-colour-yellow: #${colors.base0A};
        //   --uc-identity-colour-orange: #${colors.base09};
        //   --uc-identity-colour-red: #${colors.base08};
        //   --uc-identity-colour-pink: #${colors.base0F};
        //   --uc-identity-colour-purple: #${colors.base0E};

        //   /*  Cascades main Colour Scheme */
        //   --uc-base-colour: #${colors.base00};
        //   --uc-highlight-colour: #${colors.base01};
        //   --uc-inverted-colour: #${colors.base05};
        //   --uc-muted-colour: #${colors.base04};
        //   --uc-accent-colour: var(--uc-identity-colour-purple);
        // }
        // @import "${toString ./colors.css}";
	*/

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

