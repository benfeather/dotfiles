{
  homeDirectory,
  host,
  pkgs,
  ...
}:
{
  imports = [
    # Programs
    ./programs/fish.nix
    ./programs/git.nix
    ./programs/starship.nix
    ./programs/zsh.nix

    # Scripts
    ./scripts/nix-rebuild.nix
    ./scripts/nix-upgrade.nix
  ];

  home = {
    homeDirectory = homeDirectory;
    stateVersion = "25.05";
    username = host.user;

    sessionVariables = {
      ANDROID_HOME = "$HOME/Library/Android/sdk";
      NDK_HOME = "$ANDROID_HOME/ndk/$(ls -1 $ANDROID_HOME/ndk)";
    };
  };
}
