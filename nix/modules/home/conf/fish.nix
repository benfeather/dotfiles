{
  pkgs,
  ...
}:
{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting 
      starship init fish | source
    '';

    shellAliases = {
      cls = "clear";
      la = "ls -la";
      ll = "ls -l";
    };
  };
}
