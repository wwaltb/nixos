{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  options = {
    tofi.enable = lib.mkEnableOption "tofi config";
  };

  config = lib.mkIf config.tofi.enable {
    programs.tofi = {
      enable = true;
      settings = {
        selection-background-padding = "0, -1";
      };
    };
  };
}
