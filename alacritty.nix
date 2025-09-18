{config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.4;
        dimensions = {
          columns = 150;
          lines = 50;
        };
        blur = true;
      };
      colors.primary = {
        foreground = "#5DBDC9";
        background = "#260D12";
      };
      font = {
        size = 15;
      };
    };
  };  
}
