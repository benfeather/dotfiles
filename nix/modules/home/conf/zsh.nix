{
  pkgs,
  ...
}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;

    envExtra = ''
      SHELL_SESSIONS_DISABLE=1
    '';

    initContent = ''
      eval "$(starship init zsh)"

      if [[ "$(uname -s)" == "Darwin" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
      fi
    '';

    shellAliases = {
      cls = "clear";
      dev-chrome = "if [[ \"$(uname -s)\" == \"Darwin\" ]]; then open -a \"Google Chrome\" --args --ignore-certificate-errors --user-data-dir /tmp/chrome_dev; elif command -v google-chrome &> /dev/null; then google-chrome --ignore-certificate-errors --user-data-dir /tmp/chrome_dev; elif command -v google-chrome-stable &> /dev/null; then google-chrome-stable --ignore-certificate-errors --user-data-dir /tmp/chrome_dev; else echo \"Google Chrome not found on this system.\"; fi";
      la = "ls -la";
      ll = "ls -l";
      nix-rebuild = "if [[ \"$(uname -s)\" == \"Darwin\" ]]; then sudo darwin-rebuild switch --flake ~/Dotfiles/nix; else sudo nixos-rebuild switch --flake ~/Dotfiles/nix; fi";
      nix-upgrade = "if [[ \"$(uname -s)\" == \"Darwin\" ]]; then brew update && brew upgrade && brew cleanup; else sudo nixos-rebuild switch --upgrade --flake ~/Dotfiles/nix; fi";
    };
  };
}
