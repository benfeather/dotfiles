{
  homeDirectory,
  host,
  pkgs,
  ...
}:
{
  # Homebrew
  homebrew.brews = [
    "biome"
    "bun"
    "composer"
    "ddev"
    "mkcert"
    "node@24"
    "oxlint"
    "php@8.3"
    "python@3"
  ];

  homebrew.casks = [
    "adguard"
    "android-platform-tools"
    "arc"
    "beeper"
    "brave-browser"
    "crossover"
    "cyberduck"
    "docker-desktop"
    "github"
    "godot"
    "google-chrome"
    "grammarly-desktop"
    "iina"
    "obsidian"
    "onlyoffice"
    "plex"
    "proton-drive"
    "proton-pass"
    "protonvpn"
    "setapp"
    "sequel-ace"
    "visual-studio-code"
    "zen"
    "zoom"
  ];

  homebrew.masApps = {
    affinity-designer = 1616831348;
    affinity-photo = 1616822987;
    unarchiver = 425424353;
    xcode = 497799835;
  };

  homebrew.taps = [
    "ddev/ddev"
    "oven-sh/bun"
  ];

  # System Dock Configuration
  system.defaults.dock = {
    persistent-apps = [
      { app = "/Applications/Arc.app"; }
      { app = "/Applications/Zen.app"; }
      { app = "/Applications/Brave\ Browser.app"; }
      {
        spacer = {
          small = true;
        };
      }
      { app = "/System/Applications/Utilities/Terminal.app"; }
      { app = "/Applications/Visual\ Studio\ Code.app"; }
      { app = "/Applications/GitHub\ Desktop.app"; }
      { app = "/Applications/Cyberduck.app"; }
      { app = "/Applications/Sequel\ Ace.app"; }
      {
        spacer = {
          small = true;
        };
      }
      { app = "/Applications/Proton\ Pass.app"; }
      { app = "/Users/ben/Applications/Brave\ Browser\ Apps.localized/YouTube.app"; }
      { app = "/Applications/Beeper\ Desktop.app"; }
      { app = "/Applications/Obsidian.app"; }
      { app = "/Applications/CrossOver.app"; }
    ];

    persistent-others = [ ];
  };

  # Users
  users.users.${host.user} = {
    name = host.user;
    home = homeDirectory;
  };
}
