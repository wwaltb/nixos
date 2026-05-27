{
  lib,
  osConfig,
  ...
}: {
  config = lib.mkIf osConfig.features.git.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "wwaltb";
          email = "wwaltb@proton.me";
        };
        pull.rebase = "false";
        init.defaultbranch = "main";
      };
    };
  };
}
