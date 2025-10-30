{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    git
  ];

  programs.git = {
    enable = true;
    extraConfig = {
      init.defaultBranch = "master";
      ignores = [
        ".DS_Store"
      ];
      pull.ff = "only";
      rebase.autoStash = true;
    };
    userEmail = "contact@benfeather.dev";
    userName = "Ben Feather";
  };
}
