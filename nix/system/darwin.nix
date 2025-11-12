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
    onActivation.autoUpdate = false;
    onActivation.cleanup = "zap";
    onActivation.upgrade = false;
  };

  # Security
  security.pam.services.sudo_local.enable = true;
  security.pam.services.sudo_local.touchIdAuth = true;

  # System Defaults: Dock
  system.defaults.dock = {
    autohide = true;
    autohide-delay = 0.2;
    largesize = 72;
    launchanim = false;
    magnification = true;
    mineffect = "scale";
    minimize-to-application = true;
    mru-spaces = false;
    orientation = "bottom";
    show-recents = false;
    tilesize = 48;
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
    FXRemoveOldTrashItems = true;
    NewWindowTarget = "Home";
    ShowExternalHardDrivesOnDesktop = false;
    ShowHardDrivesOnDesktop = false;
    ShowMountedServersOnDesktop = false;
    ShowPathbar = true;
    ShowRemovableMediaOnDesktop = false;
    ShowStatusBar = true;
  };

  # System Defaults: Other
  system.defaults = {
    hitoolbox.AppleFnUsageType = "Do Nothing";
    loginwindow.GuestEnabled = false;
    magicmouse.MouseButtonMode = "TwoButton";
    spaces.spans-displays = false;
    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
    trackpad.Clicking = true;
  };

  # General System Settings
  system.keyboard.enableKeyMapping = true;
  system.primaryUser = host.user;
  system.stateVersion = 6;
}
