{
  inputs,
  lib,
  config,
  pkgs,
  self, 
  nix-darwin, 
  nix-homebrew, 
  nixpkgs, 
  home-manager,
  ...
}:
{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };

    brews = [
      "ddev"
      "docker"
      "docker-compose"
      "git"
      "mkcert"
    ];

    casks = [
      "adguard"
      "arc"
      "brave-browser"
      "crossover"
      "cyberduck"
      "firefox@developer-edition"
      "font-adwaita"
      "font-fira-code"
      "font-open-sans"
      "font-roboto"
      "github"
      "godot"
      "google-chrome"
      "orbstack"
      "setapp"
      "sequel-ace"
      "spotify"
      "visual-studio-code"
      "warp"
    ];

    masApps = {
      "affinity-designer" = 1616831348;
      "affinity-photo" = 1616822987;
      "whatsapp" = 310633997;
      "unarchiver" = 425424353;
      "xcode" = 497799835;
    };

    taps = [
      "ddev/ddev"
    ];
  };


  nixpkgs = {
    hostPlatform = "aarch64-darwin";
  };
  
  system.stateVersion = 6;

  users = {
    users = {
      ben = {
        shell = pkgs.zsh;
      };
    };
  };
}