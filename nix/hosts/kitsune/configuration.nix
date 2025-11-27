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
      { app = "/Applications/Google\ Chrome.app"; }
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
      {
        spacer = {
          small = true;
        };
      }
      { app = "/Users/ben/Applications/Brave\ Browser\ Apps.localized/YouTube.app"; }
      { app = "/Users/ben/Applications/Brave\ Browser\ Apps.localized/Proton\ Mail.app"; }
      { app = "/Users/ben/Applications/Brave\ Browser\ Apps.localized/Proton\ Calendar.app"; }
      { app = "/Applications/Proton\ Pass.app"; }
      { app = "/Applications/ProtonVPN.app"; }
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
