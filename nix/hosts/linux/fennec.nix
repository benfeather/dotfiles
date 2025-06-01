{
  host,
  pkgs,
  ...
}:
{
  hardware.nvidia = {
    enable = true;
    modesetting.enable = true;
  }
}
