{
  pkgs,
  ...
}:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    initContent = ''
      eval "$(starship init zsh)"

      if [[ "$(uname -s)" == "Darwin" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
      fi
    '';
    envExtra = ''
      SHELL_SESSIONS_DISABLE=1
    '';
  };
}
