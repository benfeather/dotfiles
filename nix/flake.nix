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
    HOSTNAME = builtins.getEnv "HOSTNAME";
  in
  {
    darwinConfigurations."HOSTNAME" = nix-darwin.lib.darwinSystem {
      modules = [
        "./hosts/darwin/${HOSTNAME}/configuration.nix"
      ];
      specialArgs = {
        inherit inputs;
      };
    };
  };
}
