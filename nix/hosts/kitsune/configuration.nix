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
    "affinity-designer"
    "affinity-photo"
    "android-platform-tools"
    "beeper"
    "brave-browser"
    "crossover"
    "cursor"
    "cyberduck"
    "docker-desktop"
    "github"
    "ghostty"
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
      { app = "/Applications/Ghostty.app"; }
      { app = "/Applications/Visual\ Studio\ Code.app"; }
      { app = "/Applications/Docker.app"; }
      { app = "/Applications/GitHub\ Desktop.app"; }
      { app = "/Applications/Cyberduck.app"; }
      { app = "/Applications/Sequel\ Ace.app"; }
      {
        spacer = {
          small = true;
        };
      }
      { app = "/Users/ben/Applications/Brave\ Browser\ Apps.localized/YouTube.app"; }
      { app = "/Users/ben/Applications/Brave\ Browser\ Apps.localized/Proton\ Mail.app"; }
      { app = "/Users/ben/Applications/Brave\ Browser\ Apps.localized/Proton\ Calendar.app"; }
      { app = "/Users/ben/Applications/Brave\ Browser\ Apps.localized/T3\ Chat.app"; }
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
