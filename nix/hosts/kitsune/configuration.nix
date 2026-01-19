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
    "cocoapods"
    "composer"
    "ddev"
    "mkcert"
    "node@24"
    "oxlint"
    "php@8.4"
    "python3"
    "rust"
    "rustup"
  ];

  homebrew.casks = [
    "adguard"
    "affinity"
    "android-platform-tools"
    "android-studio"
    "beeper"
    "brave-browser"
    "crossover"
    "cyberduck"
    "docker-desktop"
    "github"
    "godot"
    "gcloud-cli"
    "grammarly-desktop"
    "iina"
    "obsidian"
    "onlyoffice"
    "plex"
    "proton-drive"
    "proton-mail"
    "proton-pass"
    "protonvpn"
    "setapp"
    "sequel-ace"
    "spotify"
    "visual-studio-code"
    "zen"
    "zoom"
  ];

  homebrew.masApps = {
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
      { app = "/Applications/Zen.app"; }
      { app = "/Applications/Brave\ Browser.app"; }
      {
        spacer = {
          small = true;
        };
      }
      { app = "/System/Applications/Utilities/Terminal.app"; }
      { app = "/Applications/Visual\ Studio\ Code.app"; }
      { app = "/Applications/Docker.app/Contents/MacOS/Docker\ Desktop.app"; }
      { app = "/Applications/GitHub\ Desktop.app"; }
      { app = "/Applications/Cyberduck.app"; }
      { app = "/Applications/Sequel\ Ace.app"; }
      { app = "/Applications/Setapp/TablePlus.app"; }
      {
        spacer = {
          small = true;
        };
      }
      { app = "/Applications/Spotify.app"; }
      { app = "/Applications/Plex.app"; }
      { app = "/Users/ben/Applications/Brave\ Browser\ Apps.localized/T3\ Chat.app"; }
      { app = "/Users/ben/Applications/Brave\ Browser\ Apps.localized/YouTube.app"; }
      { app = "/Applications/Proton\ Mail.app"; }
      { app = "/Applications/Proton\ Pass.app"; }
      { app = "/Applications/Beeper\ Desktop.app"; }
      { app = "/Applications/Obsidian.app"; }
      { app = "/Applications/CrossOver.app"; }
    ];

    persistent-others = [ ];
  };

  # General System Settings
  system.stateVersion = 6;

  # Users
  users.users.${host.user} = {
    name = host.user;
    home = homeDirectory;
  };
}
