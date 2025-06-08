{
  homeDirectory,
  host,
  pkgs,
  ...
}:
{
  # Packages
  environment.systemPackages = with pkgs; [
    "git"
    "home-manager"
    "nixfmt-rfc-style"
    "oh-my-zsh"
    "zsh"
    "zsh-powerlevel10k"
  ];

  # Fonts
  fonts.packages = with pkgs; [
    "fira-code"
    "jetbrains-mono"
    "open-sans"
    "roboto"
  ];

  # Networking
  networking.hostName = host.name;

  # Nix
  nix.settings.experimental-features = "flakes nix-command";
  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "${host.arch}-${host.os}";

  # Programs
  programs.fish.enable = false;
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;

  # Time
  time.timeZone = "Pacific/Auckland";

  # Users
  users.users.${host.user} = {
    home = homeDirectory;
    name = host.user;
    shell = pkgs.zsh;
  };
}
