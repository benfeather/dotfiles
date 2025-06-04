{
  host,
  ...
}:
{
  networking = {
    networkmanager = {
      enable = true;
    };
  };

  users.users.${host.user} = {
    isNormalUser = true;
  };
}
