{
  homeDirectory,
  host,
  pkgs,
  ...
}:
{
  # Environment Packages
  environment.systemPackages = with pkgs; [
    git
    home-manager
    nixfmt-rfc-style
    oh-my-zsh
    zsh
    zsh-powerlevel10k
  ];

  # Fonts
  fonts.packages = with pkgs; [
    fira-code
    open-sans
    roboto
  ];

  # Hardware & Networking
  networking.hostName = host.name;

  # Nix & Nixpkgs
  nix.settings.experimental-features = "flakes nix-command";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "${host.arch}-${host.os}";

  # Programs
  programs.fish.enable = false;
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;

  # Time
  time.timeZone = "Pacific/Auckland";

  # User Definition (Not Flattened)
  users.users.${host.user} = {
    home = homeDirectory;
    name = host.user;
    shell = pkgs.zsh;
  };
}
