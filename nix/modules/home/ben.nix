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

  # Programs: Git
  programs.git = {
    enable = true;
    extraConfig.init.defaultBranch = "master";
    userEmail = "contact@benfeather.dev";
    userName = "Ben Feather";
  };

  # Programs: Starship Terminal Prompt
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
    };
  };

  # Programs: ZSH
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    initContent = ''
      eval "$(starship init zsh)"
    '';
  };
}
