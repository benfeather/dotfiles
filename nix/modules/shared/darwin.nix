{
  host,
  ...
}:
{
  # Homebrew & Mac App Store
  homebrew.enable = true;
  homebrew.masApps = {
    xcode = 497799835;
  };
  homebrew.onActivation.autoUpdate = true;
  homebrew.onActivation.cleanup = "zap";
  homebrew.onActivation.upgrade = true;

  # Security
  security.pam.services.sudo_local.enable = true;
  security.pam.services.sudo_local.touchIdAuth = true;

  # System Defaults: Dock
  system.defaults.dock.autohide = true;
  system.defaults.dock.autohide-delay = 0.2;
  system.defaults.dock.launchanim = false;
  system.defaults.dock.mineffect = "scale";
  system.defaults.dock.mru-spaces = false;
  system.defaults.dock.orientation = "bottom";
  system.defaults.dock.show-recents = false;
  system.defaults.dock.wvous-bl-corner = 1;
  system.defaults.dock.wvous-br-corner = 1;
  system.defaults.dock.wvous-tl-corner = 1;
  system.defaults.dock.wvous-tr-corner = 1;

  # System Defaults: Finder
  system.defaults.finder._FXSortFoldersFirst = true;
  system.defaults.finder._FXSortFoldersFirstOnDesktop = true;
  system.defaults.finder.AppleShowAllExtensions = true;
  system.defaults.finder.AppleShowAllFiles = false;
  system.defaults.finder.FXEnableExtensionChangeWarning = false;
  system.defaults.finder.FXPreferredViewStyle = "clmv";
  system.defaults.finder.NewWindowTarget = "Home";
  system.defaults.finder.ShowPathbar = true;
  system.defaults.finder.ShowStatusBar = true;

  # System Defaults: Other
  system.defaults.loginwindow.GuestEnabled = false;
  system.defaults.magicmouse.MouseButtonMode = "TwoButton";
  system.defaults.SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
  system.defaults.spaces.spans-displays = false;
  system.defaults.trackpad.Clicking = true;

  # General System Settings
  system.keyboard.enableKeyMapping = true;
  system.primaryUser = host.user;
  system.stateVersion = 6;
}
