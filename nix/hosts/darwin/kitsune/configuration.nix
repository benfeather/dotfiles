{
  homeDirectory,
  host,
  pkgs,
  ...
}:
{
  # Homebrew
  homebrew.brews = [
    "bun"
    "ddev"
    "docker"
    "docker-compose"
    "mkcert"
    "node@22"
    "php@8.3"
  ];

  homebrew.casks = [
    "adguard"
    "android-platform-tools"
    "arc"
    "brave-browser"
    "crossover"
    "cyberduck"
    "ghostty"
    "github"
    "godot"
    "google-chrome"
    "iina"
    "jellyfin-media-player"
    "jordanbaird-ice"
    "obsidian"
    "onlyoffice"
    "orbstack"
    "plex"
    "proton-drive"
    "setapp"
    "sequel-ace"
    "spotify"
    "visual-studio-code"
    "zen"
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
    { app = "/Applications/Zen.app"; }
    { app = "/Applications/Brave\ Browser.app"; }
    {
      spacer = {
        small = true;
      };
    }
    { app = "/Applications/Ghostty.app"; }
    { app = "/Applications/Visual\ Studio\ Code.app"; }
    { app = "/Applications/Cyberduck.app"; }
    { app = "/Applications/Sequel\ Ace.app"; }
    { app = "/Applications/OrbStack.app"; }
    { app = "/Applications/GitHub\ Desktop.app"; }
    { app = "/Applications/Godot.app"; }
    {
      spacer = {
        small = true;
      };
    }
    { app = "/Applications/Spotify.app"; }
    { app = "/Applications/WhatsApp.app"; }
    { app = "/Applications/ONLYOFFICE.app"; }
    { app = "/Applications/Obsidian.app"; }
    { app = "/Applications/Affinity\ Photo\ 2.app"; }
    { app = "/Applications/Affinity\ Designer\ 2.app"; }
    { app = "/Applications/CrossOver.app"; }
  ];

  # Users
  users.users.${host.user} = {
    name = host.user;
    shell = pkgs.fish;

    # Home Directory
    createHome = true;
    home = homeDirectory;
    homeMode = "700";
  };
}
