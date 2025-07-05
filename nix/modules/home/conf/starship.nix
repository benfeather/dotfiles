{
  pkgs,
  ...
}:
{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
    };
  };
}
