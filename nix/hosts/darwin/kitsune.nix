{
  host,
  pkgs,
  ...
}:
{
  homebrew = {
    brews = [
      "ddev"
      "docker"
      "docker-compose"
      "mkcert"
    ];

    casks = [
      "adguard"
      "android-platform-tools"
      "arc"
      "brave-browser"
      "crossover"
      "cyberduck"
      "firefox@developer-edition"
      "font-adwaita"
      "font-fira-code"
      "font-open-sans"
      "font-roboto"
      "github"
      "godot"
      "google-chrome"
      "obsidian"
      "orbstack"
      "proton-drive"
      "setapp"
      "sequel-ace"
      "spotify"
      "visual-studio-code"
      "warp"
    ];

    masApps = {
      "affinity-designer" = 1616831348;
      "affinity-photo" = 1616822987;
      "whatsapp" = 310633997;
      "unarchiver" = 425424353;
    };

    taps = [
      "ddev/ddev"
    ];
  };
}
