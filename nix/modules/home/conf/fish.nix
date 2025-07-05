{
  pkgs,
  ...
}:
{
  programs.fish = {
    enable = true;
    initExtra = ''
      eval "$(starship init fish)"

      if [[ "$(uname -s)" == "Darwin" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
      fi
    '';
  };
}
