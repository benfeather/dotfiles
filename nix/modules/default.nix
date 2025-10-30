{
  homeDirectory,
  host,
  inputs,
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

  # Home manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.${host.user} = import ../home/${host.user}/default.nix;

    extraSpecialArgs = {
      inherit homeDirectory;
      inherit host;
      inherit inputs;
    };
  };

  # Networking
  networking.hostName = host.name;

  # Nix
  nix.settings.experimental-features = "flakes nix-command";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "${host.arch}-${host.os}";

  # Enable Shells
  programs.fish.enable = true;
  programs.zsh.enable = true;

  # Time
  time.timeZone = "Pacific/Auckland";
}
