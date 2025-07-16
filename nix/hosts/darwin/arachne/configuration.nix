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
    "brave-browser"
    "cyberduck"
    "docker-desktop"
    "ghostty"
    "github"
    "google-chrome"
    "iina"
    "jordanbaird-ice"
    "setapp"
    "sequel-ace"
    "visual-studio-code"
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
    { app = "/Users/benfeather/Applications/Brave\ Browser\ Apps.localized/Google\ Chat.app"; }
    {
      spacer = {
        small = true;
      };
    }
    { app = "/Applications/Ghostty.app"; }
    { app = "/Applications/Visual\ Studio\ Code.app"; }
    { app = "/Applications/Cyberduck.app"; }
    { app = "/Applications/Sequel\ Ace.app"; }
    { app = "/Applications/Docker.app"; }
    { app = "/Applications/GitHub\ Desktop.app"; }
  ];

  # Users
  users.users.${host.user} = {
    name = host.user;
    shell = pkgs.fish;
    home = homeDirectory;
  };
}
