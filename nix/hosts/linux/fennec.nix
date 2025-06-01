{
  host,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    bottles
    gnome-shell-extension-dash-to-dock
    heroic
    lutris
    mangohud
    protonup-qt
  ];

  hardware = {
    nvidia = {
      enable = true;
      modesetting.enable = true;
    };

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32bit = true;
    };
  };

  programs = {
    gamemode.enable = true;

    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };
}
