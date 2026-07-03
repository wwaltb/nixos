{self, ...}: {
  flake.modules.nixos.fish = {pkgs, ...}: {
    programs.fish.enable = true;
    users.defaultUserShell = pkgs.fish;

    home-manager.users.walt.imports = [
      self.modules.homeManager.fish
    ];
  };

  flake.modules.homeManager.fish = {
    config,
    lib,
    ...
  }: {
    programs.fish = {
      enable = true;
      shellInit = with config.lib.stylix.colors; ''
        set -g fish_color_autosuggestion ${base04}
        set -g fish_color_command ${base0C}
        set -g fish_color_param ${base0E}
        set -g fish_color_error ${base0F}
        set -g fish_color_comment ${base04}
      '';
      interactiveShellInit = ''
        set -g fish_greeting
      '';
    };

    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        add_newline = false;

        format = lib.concatStrings [
          "$directory"
          "$git_branch"
          "$git_status"
          "$nix_shell"
          "$status"
          # "$line_break"
          "$character"
        ];

        directory = {
          style = "green";
          truncation_length = 3;
          truncate_to_repo = false;
        };

        git_branch = {
          symbol = "";
          style = "bold purple";
          format = "[\\[$symbol$branch]($style)";
        };

        git_status = {
          style = "bold purple";
          format = "[$ahead_behind$all_status\\]]($style) ";
          # format = "([\\[$staged$conflicted$modified$untracked$stashed\\]]($style) )";
          modified = "[✚\${count}](blue)";
          staged = "[\${count}](yellow)";
          renamed = "[»\${count}](blue)";
          deleted = "[✖\${count}](red)";
          ahead = "[↑\${count}](orange)";
          behind = "[↓\${count}](orange)";
          diverged = "[↕↑\${ahead_count}↓\${behind_count}](orange)";
          conflicted = "[\${count}](red)";
          untracked = "[✚\${count}](green)";
          stashed = "⚑\${count}";
          up_to_date = "";
        };

        nix_shell = {
          symbol = " ";
          format = "[$symbol$state]($style) ";
        };

        status = {
          disabled = false;
          pipestatus = true;
          pipestatus_format = "[\\[$pipestatus\\]]($style)";
          pipestatus_segment_format = "$status";
          pipestatus_separator = "|";
          style = "bold red";
          format = "[\\[$status\\]]($style) ";
        };

        character = {
          success_symbol = "[>](bold brown)";
          error_symbol = "[>](bold brown)";
        };
      };
    };
  };
}
