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
    mkHost = { host, arch, os, ... }: {
      darwinConfigurations."${host}" = nix-darwin.lib.darwinSystem {
        system = "${arch}-darwin";
        modules = [
          ./hosts/common/default.nix
          ./hosts/${arch}/${os}/${host}.nix
        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };
  in 
   {
    darwinConfigurations = {
      kitsune = mkHost {
        host = "kitsune";
        arch = "aarch64";
        os = "darwin";
      };
    };
  };
}
