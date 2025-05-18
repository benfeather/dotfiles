{
  home-manager,
  host,
  pkgs,
  ...
}:
{
  environment = {
    systemPackages = [
      pkgs.nixfmt-rfc-style
      pkgs.oh-my-zsh
      pkgs.zsh
      pkgs.zsh-powerlevel10k
    ];
  };

  nix = {
    settings = {
      experimental-features = "flakes nix-command";
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    hostPlatform = "${host.arch}-${host.os}";
  };

  programs = {
    bash.enable = false;

    fish.enable = false;

    zsh = {
      enable = true;
      enableCompletion = true;
    };
  };

  system = {
    stateVersion = 6;
  };

  users.users.${host.user} = {
    home =  if host.os == "darwin" then "/Users/${host.user}" else "/home/${host.user}";
    name = host.user;
    shell = pkgs.zsh;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  }
}