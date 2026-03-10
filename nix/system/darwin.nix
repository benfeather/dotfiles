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

  # Firewall
  networking.applicationFirewall = {
    enable = true;
    enableStealthMode = true;
    allowSigned = false;
    allowSignedApp = false;
    blockAllIncoming = true;
  };

  # Security
  security.pam.services.sudo_local.enable = true;
  security.pam.services.sudo_local.touchIdAuth = true;

  # System Defaults
  system.defaults = {
    dock = {
      autohide = true;
      autohide-delay = 0.2;
      largesize = 60;
      launchanim = false;
      magnification = true;
      mineffect = "scale";
      minimize-to-application = false;
      mru-spaces = false;
      orientation = "bottom";
      show-recents = false;
      tilesize = 40;
      wvous-bl-corner = 1;
      wvous-br-corner = 1;
      wvous-tl-corner = 1;
      wvous-tr-corner = 1;
    };

    finder = {
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

    # Input
    hitoolbox.AppleFnUsageType = "Do Nothing";
    magicmouse.MouseButtonMode = "TwoButton";
    trackpad.Clicking = true;

    # Login & Security
    loginwindow.GuestEnabled = false;
    SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;

    # Other
    controlcenter.AirDrop = false;
    spaces.spans-displays = false;
  };

  # General System Settings
  system.keyboard.enableKeyMapping = true;
  system.primaryUser = host.user;
}
