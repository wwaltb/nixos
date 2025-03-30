{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  options = {
    git.enable = lib.mkEnableOption "git config";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = "wwaltb";
      userEmail = "wwaltb@proton.me";
      extraConfig = {
        pull.rebase = "false";
        init.defaultbranch = "main";
      };
    };
  };
}
