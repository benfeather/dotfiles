{
  homeDirectory,
  host,
  pkgs,
  ...
}:
{
  home.homeDirectory = homeDirectory;
  home.stateVersion = "25.11";
  home.username = host.user;

  # Programs: Git
  programs.git = {
    enable = true;
    extraConfig.init.defaultBranch = "master";
    userEmail = "contact@benfeather.dev";
    userName = "Ben Feather";
  };

  # Programs: ZSH
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
    };
  };
}
