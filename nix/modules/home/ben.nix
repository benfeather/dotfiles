{
  homeDirectory,
  host,
  pkgs,
  ...
}:
{
  # Home
  home.homeDirectory = homeDirectory;
  home.stateVersion = "25.05";
  home.username = host.user;

  # Programs: Git
  programs.git.enable = true;
  programs.git.extraConfig.init.defaultBranch = "master";
  programs.git.userEmail = "contact@benfeather.dev";
  programs.git.userName = "Ben Feather";

  # Programs: Zsh
  programs.zsh.enable = true;
  programs.zsh.oh-my-zsh.plugins = with pkgs.zshPlugins; [
    git
    zsh-autosuggestions
    zsh-completions
    zsh-history-substring-search
    zsh-syntax-highlighting
  ];
}
