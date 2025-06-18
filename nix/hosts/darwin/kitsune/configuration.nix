{
  host,
  pkgs,
  ...
}:
{
  # Homebrew
  homebrew.brews = [ ];

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
    "jordanbaird-ice"
    "obsidian"
    "onlyoffice"
    "orbstack"
    "proton-drive"
    "setapp"
    "sequel-ace"
    "spotify"
    "visual-studio-code"
    "warp"
    "zen"
  ];

  homebrew.masApps = {
    affinity-designer = 1616831348;
    affinity-photo = 1616822987;
    whatsapp = 310633997;
    unarchiver = 425424353;
    xcode = 497799835;
  };

  homebrew.taps = [ ];

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
}
