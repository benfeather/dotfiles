{
  homeDirectory,
  host,
  pkgs,
  ...
}:
{
  home = {
    homeDirectory = homeDirectory;

    shellAliases = {
      dev-chrome = "/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --ignore-certificate-errors --user-data-dir=/tmp/chrome_dev";
      la = "ls -la";
      ll = "ls -l";
      mac-update = "brew update && brew upgrade && brew cleanup";
      mac-rebuild = "sudo darwin-rebuild switch --flake ~/Dotfiles/nix";
      nix-rebuild = "sudo nixos-rebuild switch --upgrade --flake ~/Dotfiles/nix";
    };

    stateVersion = "25.05";

    username = host.user;
  };

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
      add_newline = true;
    };
  };

  # Programs: ZSH
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    initContent = ''
      eval "$(starship init zsh)"
    '';
    envExtra = ''
      SHELL_SESSIONS_DISABLE=1
    '';
  };
}
