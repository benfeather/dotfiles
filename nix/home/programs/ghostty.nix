{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    ghostty
  ];

  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    settings = {
      theme = "catppuccin-mocha";
    };
  };
}
