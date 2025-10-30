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
      pull.ff = "only";
      rebase.autoStash = true;
    };
    ignores = [
      ".DS_Store"
    ];
    userEmail = "contact@benfeather.dev";
    userName = "Ben Feather";
  };
}
