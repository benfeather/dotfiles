{
  inputs,
  ...
}:
{
  imports = [
    ./_environment.nix
    ./_programs.nix
    ./_system.nix
  ];

  nix = {
    settings = {
      experimental-features = "flakes nix-command";
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}