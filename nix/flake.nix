{
  description = "Ben's MacOS and NixOS configurations";

  inputs = {
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };

    nix-darwin = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-darwin/nix-darwin/master";
    };

    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
    };

    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
  };

  outputs = { self, nix-darwin, nix-homebrew, nixpkgs, home-manager, ... } @ inputs:
  let 
    mkHost = import ./lib/mkHost.nix { inherit inputs; };

    darwinHosts = {
      "kitsune" = mkHost {
        hostname = "kitsune";
        arch = "aarch64";
        username = "ben";
      };
    };

    linuxHosts = {};
  in 
  {
    inherit darwinHosts linuxHosts;

    darwinConfigurations = builtins.mapAttrs (name: config: config) darwinHosts;
  };
}
