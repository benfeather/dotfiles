{
  inputs,
  ...
}:
{
  system = {
    defaults = {
      dock = {
        autohide = true;
        autohide-delay = 0.2;
        mineffect = "scale";
        mru-spaces = false;
        launchanim = false;
        orientation = "bottom";
        show-recents = false;
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
        NewWindowTarget = "Home";
        ShowPathbar = true;
        ShowStatusBar = true;
      };

      loginwindow = {
        GuestEnabled = false;
      };

      magicmouse = {
        MouseButtonMode = "TwoButton";
      };

      SoftwareUpdate = {
        AutomaticallyInstallMacOSUpdates = true;
      };

      spaces = {
        spans-displays = false;
      };

      trackpad = {
        Clicking = true;
      };
    };

    keyboard = {
      enableKeyMapping = true;
    };
  };
}