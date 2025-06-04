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

  fonts = {
    packages = with pkgs; [
      fira-code
      open-sans
      roboto
    ];
  };

  networking = {
    hostName = host.name;
  };

  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-tha 7d";
    };

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
    fish.enable = false;

    zsh = {
      enable = true;
      enableCompletion = true;
    };
  };

  time = {
    timeZone = "Pacific/Auckland";
  };

  users.users.${host.user} = {
    home = homeDirectory;
    name = host.user;
    shell = pkgs.zsh;
  };
}
