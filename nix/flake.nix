{
  description = "Ben's MacOS and NixOS configurations";

  inputs = {
    darwin.url = "github:nix-darwin/nix-darwin/master";
    home-manager.url = "github:nix-community/home-manager";
    homebrew.url = "github:zhaofengli/nix-homebrew";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, darwin, nixpkgs, ... } @ inputs: {
    macHosts = [
      {
        hostname = "kitsune";
        system = "aarch64-darwin";
        username = "ben";
      }
    ];

    darwinConfigurations = builtins.mapAttrs (name: config: {
      inherit name;
      config = {
        hostname = config.hostname;
        system = config.system;
        modules = [
          ./darwin.nix
        ];
      };
    }) macHosts;
  };
}
