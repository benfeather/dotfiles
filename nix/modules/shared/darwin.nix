{
  host,
  ...
}:
{
  environment.variables = {
    "HOMEBREW_NO_ENV_HINTS" = "TRUE";
  };

  # Homebrew
  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.cleanup = "zap";
    onActivation.upgrade = true;
  };

  # Security
  security.pam.services.sudo_local.enable = true;
  security.pam.services.sudo_local.touchIdAuth = true;

  # System Defaults: Dock
  system.defaults.dock = {
    autohide = true;
    autohide-delay = 0.2;
    launchanim = false;
    mineffect = "scale";
    mru-spaces = false;
    orientation = "bottom";
    show-recents = false;
    wvous-bl-corner = 1;
    wvous-br-corner = 1;
    wvous-tl-corner = 1;
    wvous-tr-corner = 1;
  };

  # System Defaults: Finder
  system.defaults.finder = {
    _FXSortFoldersFirst = true;
    _FXSortFoldersFirstOnDesktop = true;
    AppleShowAllExtensions = true;
    AppleShowAllFiles = false;
    FXEnableExtensionChangeWarning = false;
    FXPreferredViewStyle = "clmv";
    NewWindowTarget = "Home";
    ShowPathbar = true;
    ShowStatusBar = true;
  };

  # System Defaults: Other
  system.defaults = {
    loginwindow.GuestEnabled = false;
    magicmouse.MouseButtonMode = "TwoButton";
    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
    spaces.spans-displays = false;
    trackpad.Clicking = true;
  };

  # General System Settings
  system.keyboard.enableKeyMapping = true;
  system.primaryUser = host.user;
  system.stateVersion = 6;
}
