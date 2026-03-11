{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    fish
  ];

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting ""

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
