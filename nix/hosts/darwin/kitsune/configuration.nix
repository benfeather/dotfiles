{
  host,
  pkgs,
  ...
}:
{
  # Homebrew
  homebrew.brews = [
    "ddev"
    "docker"
    "docker-compose"
    "mkcert"
  ];

  homebrew.casks = [
    "adguard"
    "android-platform-tools"
    "arc"
    "brave-browser"
    "crossover"
    "cyberduck"
    "firefox@developer-edition"
    "github"
    "godot"
    "google-chrome"
    "jordanbaird-ice"
    "obsidian"
    "orbstack"
    "proton-drive"
    "setapp"
    "sequel-ace"
    "spotify"
    "visual-studio-code"
    "zen"
  ];

  homebrew.masApps = {
    "affinity-designer" = 1616831348;
    "affinity-photo" = 1616822987;
    "whatsapp" = 310633997;
    "unarchiver" = 425424353;
  };

  homebrew.taps = [
    "ddev/ddev"
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
    { app = "/Applications/Warp.app"; }
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
    { app = "/Applications/Obsidian.app"; }
    { app = "/Applications/Affinity\ Photo\ 2.app"; }
    { app = "/Applications/Affinity\ Designer\ 2.app"; }
    { app = "/Applications/CrossOver.app"; }
  ];
}
