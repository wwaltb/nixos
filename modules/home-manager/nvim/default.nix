_: {
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
        languages = {
          enableLSP = true;
          enableTreesitter = true;

          nix.enable = true;
        };
      };
    };
  };
}
