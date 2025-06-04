{
  homeDirectory,
  host,
  pkgs,
  ...
}:
{
  home = {
    homeDirectory = homeDirectory;
    stateVersion = "25.05";
    username = host.user;
  };

  programs = {
    git = {
      enable = true;
      extraConfig = {
        init.defaultBranch = "master";
      };
      userEmail = "contact@benfeather.dev";
      userName = "Ben Feather";
    };

    zsh = {
      enable = true;
      oh-my-zsh = {
        plugins = with pkgs.zshPlugins; [
          git
          zsh-autosuggestions
          zsh-completions
          zsh-history-substring-search
          zsh-syntax-highlighting
        ];
      };
    };
  };
}
