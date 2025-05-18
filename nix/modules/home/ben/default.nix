{ 
  homeDirectory,
  host, 
  ... 
}:
{
  home = {
    username = host.user;
    homeDirectory = homeDirectory;
    stateVersion = "25.05";
  };
}