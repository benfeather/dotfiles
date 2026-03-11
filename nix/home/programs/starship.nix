{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    starship
  ];

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
      aws = {
        disabled = true;
      };
      gcloud = {
        disabled = true;
      };
    };
  };
}
