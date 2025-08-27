{
  programs.git = {
    enable = true;
    extraConfig = {
      init.defaultBranch = "master";
      pull.ff = "only";
      rebase.autoStash = true;
    };
    userEmail = "contact@benfeather.dev";
    userName = "Ben Feather";
  };
}
