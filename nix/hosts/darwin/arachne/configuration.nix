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
    "node@22"
    "oxlint"
    "php@8.3"
  ];

  homebrew.casks = [
    "brave-browser"
    "cyberduck"
    "docker-desktop"
    "github"
    "google-chrome"
    "iina"
    "imageoptim"
    "jordanbaird-ice"
    "local"
    "postman"
    "setapp"
    "sequel-ace"
    "spotify"
    "visual-studio-code"
    "warp"
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
  system.defaults.dock.persistent-apps = [
    { app = "/Applications/Brave\ Browser.app"; }
    { app = "/Users/benfeather/Applications/Brave\ Browser\ Apps.localized/Gmail.app"; }
    { app = "/Users/benfeather/Applications/Brave\ Browser\ Apps.localized/Google\ Calendar.app"; }
    { app = "/Users/benfeather/Applications/Brave\ Browser\ Apps.localized/Google\ Keep.app"; }
    { app = "/Users/benfeather/Applications/Brave\ Browser\ Apps.localized/Google\ Chat.app"; }
    {
      spacer = {
        small = true;
      };
    }
    { app = "/Applications/Warp.app"; }
    { app = "/Applications/Visual\ Studio\ Code.app"; }
    { app = "/Applications/Cyberduck.app"; }
    { app = "/Applications/Sequel\ Ace.app"; }
    { app = "/Applications/Docker.app"; }
    { app = "/Applications/GitHub\ Desktop.app"; }
    {
      spacer = {
        small = true;
      };
    }
    { app = "/Applications/Affinity\ Photo\ 2.app"; }
    { app = "/Applications/Affinity\ Designer\ 2.app"; }
  ];

  # Users
  users.users.${host.user} = {
    name = host.user;
    shell = pkgs.fish;
    home = homeDirectory;
  };
}
