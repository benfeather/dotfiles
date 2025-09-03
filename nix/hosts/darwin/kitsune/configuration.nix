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
    "docker"
    "docker-compose"
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
    "brave-browser"
    "crossover"
    "cyberduck"
    "diffusionbee"
    "github"
    "godot"
    "google-chrome"
    "iina"
    "jellyfin-media-player"
    "jordanbaird-ice"
    "lm-studio"
    "obsidian"
    "onlyoffice"
    "orbstack"
    "plex"
    "proton-drive"
    "proton-mail"
    "protonvpn"
    "setapp"
    "sequel-ace"
    "spotify"
    "visual-studio-code"
    "warp"
    "zoom"
  ];

  homebrew.masApps = {
    affinity-designer = 1616831348;
    affinity-photo = 1616822987;
    whatsapp = 310633997;
    unarchiver = 425424353;
    xcode = 497799835;
  };

  homebrew.taps = [
    "ddev/ddev"
    "oven-sh/bun"
  ];

  # System Dock Configuration
  system.defaults.dock.persistent-apps = [
    { app = "/Applications/Arc.app"; }
    { app = "/Applications/Brave\ Browser.app"; }
    { app = "/Applications/Proton\ Mail.app"; }
    {
      spacer = {
        small = true;
      };
    }
    { app = "/Applications/Warp.app"; }
    { app = "/Applications/Visual\ Studio\ Code.app"; }
    { app = "/Applications/Cyberduck.app"; }
    { app = "/Applications/Sequel\ Ace.app"; }
    { app = "/Applications/OrbStack.app"; }
    {
      spacer = {
        small = true;
      };
    }
    { app = "/Users/ben/Applications/Brave\ Browser\ Apps.localized/YouTube.app"; }
    { app = "/Users/ben/Applications/Brave\ Browser\ Apps.localized/T3\ Chat.app"; }
    { app = "/Applications/Spotify.app"; }
    { app = "/Applications/WhatsApp.app"; }
    { app = "/Applications/Obsidian.app"; }
    { app = "/Applications/Plex.app"; }
    { app = "/Applications/CrossOver.app"; }
  ];

  # Users
  users.users.${host.user} = {
    name = host.user;
    home = homeDirectory;
  };
}
