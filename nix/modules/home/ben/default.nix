{
  homeDirectory,
  host,
  pkgs,
  ...
}:
{
  home = {
    username = host.user;
    homeDirectory = homeDirectory;
    stateVersion = "25.05";
  };

  programs = {
    git = {
      enable = true;
      userEmail = "contact@benfeather.dev";
      userName = "Ben Feather";
      extraConfig = {
        init.defaultBranch = "master";
      };
    };
  };
}
