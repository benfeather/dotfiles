{
  description = "Ben's MacOS and NixOS configurations";

  inputs = {
    darwin.url = "github:nix-darwin/nix-darwin/master";
    home-manager.url = "github:nix-community/home-manager";
    homebrew.url = "github:zhaofengli/nix-homebrew";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, darwin, nixpkgs, ... }@inputs:
    let
      macHosts = [
        {
          hostname = "kitsune";
          system = "aarch64-darwin";
          username = "ben";
        }
      ];
    in
    {
      darwinConfigurations = builtins.listToAttrs (map (host: {
        name = host.hostname;
        value = darwin.lib.darwinSystem {
          system = host.system;
          modules = [
            ./darwin.nix
          ];
          specialArgs = {
            inherit (host) hostname username;
            inherit inputs;
          };
        };
      }) macHosts);
    };
}
