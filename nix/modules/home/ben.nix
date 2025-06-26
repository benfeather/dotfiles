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
      cls = "clear";
      dev-chrome = "if [[ \"$(uname -s)\" == \"Darwin\" ]]; then open -a \"Google Chrome\" --args --ignore-certificate-errors --user-data-dir /tmp/chrome_dev; elif command -v google-chrome &> /dev/null; then google-chrome --ignore-certificate-errors --user-data-dir /tmp/chrome_dev; elif command -v google-chrome-stable &> /dev/null; then google-chrome-stable --ignore-certificate-errors --user-data-dir /tmp/chrome_dev; else echo \"Google Chrome not found on this system.\"; fi";
      la = "ls -la";
      ll = "ls -l";
      mac-rebuild = "sudo darwin-rebuild switch --flake ~/Dotfiles/nix";
      mac-update = "brew update && brew upgrade && brew cleanup";
      nix-rebuild = "sudo nixos-rebuild switch --flake ~/Dotfiles/nix";
      nix-update = "sudo nixos-rebuild switch --upgrade --flake ~/Dotfiles/nix";
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
