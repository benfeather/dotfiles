{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    zsh
  ];

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
      la = "ls -la";
      ll = "ls -l";
    };
  };
}
