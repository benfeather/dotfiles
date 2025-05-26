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
