{
  homeDirectory,
  host,
  pkgs,
  ...
}:
{
  home.homeDirectory = homeDirectory;
  home.stateVersion = "25.05";
  home.username = host.user;

  programs.git = {
    enable = true;
    extraConfig.init.defaultBranch = "master";
    userEmail = "contact@benfeather.dev";
    userName = "Ben Feather";
  };

  programs.zsh = {
    enable = true;

    oh-my-zsh.enable = true;
    oh-my-zsh.theme = "robbyrussell";

    plugins = with pkgs.zshPlugins; [
      brew
      docker
      docker-compose
      git
      git-auto-fetch
      git-commit
      zsh-autosuggestions
      zsh-completions
      zsh-syntax-highlighting
    ];
  };
}
