{self, ...}: {
  flake.modules.nixos.librewolf = {
    home-manager.users.walt.imports = [
      self.modules.homeManager.librewolf
    ];
  };

  flake.modules.homeManager.librewolf = {
    config,
    pkgs,
    ...
  }: {
    programs.librewolf = {
      enable = true;
      profiles.walt = {
        isDefault = true;
        settings = {
          "sidebar.revamp" = true;
          "sidebar.verticalTabs" = true;
          "browser.toolbars.bookmarks.visibility" = "never"; # "newtab"

          "privacy.sanitize.sanitizeOnShutdown" = "false";
        };

        search = {
          force = true;
          default = "ddg";
          privateDefault = "ddg";

          engines = {
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "channel";
                      value = "unstable";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@np"];
            };

            "Nix Options" = {
              urls = [
                {
                  template = "https://search.nixos.org/options";
                  params = [
                    {
                      name = "channel";
                      value = "unstable";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@no"];
            };

            "NixOS Wiki" = {
              urls = [
                {
                  template = "https://wiki.nixos.org/w/index.php";
                  params = [
                    {
                      name = "search";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@nw"];
            };

            "youtube" = {
              urls = [
                {
                  template = "https://youtube.com/results";
                  params = [
                    {
                      name = "search_query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              # icon = "https://brand.youtube/youtube-icon/#core-icon";
              definedAliases = ["@yt"];
            };
          };
        };

        extensions = {
          force = true;
        };
      };
    };

    stylix.targets.librewolf.profileNames = ["walt"];
    stylix.targets.librewolf.colorTheme.enable = true;
    stylix.targets.librewolf.colors.override = {
      base01 = config.lib.stylix.colors.base00;
    };
  };
}
