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
    nano
    nixfmt-rfc-style
    starship
  ];

  # Font Packages
  fonts.packages = with pkgs; [
    fira-code
    fira-mono
    jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.jetbrains-mono
  ];

  # Networking
  networking.hostName = host.name;

  # Nix
  nix.settings.experimental-features = "flakes nix-command";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "${host.arch}-${host.os}";

  # Programs: Fish
  programs.fish = {
    enable = true;
  };

  # Programs: ZSH
  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };

  # Time
  time.timeZone = "Pacific/Auckland";
}
