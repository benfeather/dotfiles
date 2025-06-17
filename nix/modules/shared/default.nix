{
  homeDirectory,
  host,
  pkgs,
  ...
}:
{
  # Environment Packages
  environment.systemPackages = with pkgs; [
    ddev
    docker
    docker-compose
    git
    home-manager
    mkcert
    nixfmt-rfc-style
    oh-my-zsh
    zsh
    zsh-autosuggestions
    zsh-completions
    zsh-powerlevel10k
    zsh-syntax-highlighting
  ];

  # Font Packages
  fonts.packages = with pkgs; [
    fira-code
    jetbrains-mono
    open-sans
    roboto
  ];

  # Networking
  networking.hostName = host.name;

  # Nix
  nix.settings.experimental-features = "flakes nix-command";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "${host.arch}-${host.os}";

  # Programs: Fish
  programs.fish.enable = false;

  # Programs: ZSH
  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };

  # Time
  time.timeZone = "Pacific/Auckland";

  # Users
  users.users.${host.user} = {
    home = homeDirectory;
    name = host.user;
    shell = pkgs.zsh;
  };
}
