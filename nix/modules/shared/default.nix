{
  homeDirectory,
  host,
  pkgs,
  ...
}:
{
  environment = {
    systemPackages = with pkgs; [
      git
      home-manager
      nixfmt-rfc-style
      oh-my-zsh
      zsh
      zsh-powerlevel10k
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

  users = {
    users.${host.user} = {
      home = homeDirectory;
      name = host.user;
      shell = pkgs.zsh;
    };
  };
}
