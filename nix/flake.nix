{
  description = "Ben's MacOS and NixOS configurations";

  inputs = {
    darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs =
    inputs@{
      nixpkgs,
      self,
      ...
    }:
    let
      hosts = [
        # Personal Desktop
        {
          name = "fenrir";
          user = "ben";
          arch = "x86_64";
          os = "linux";
        }
        # Personal Laptop
        {
          name = "kitsune";
          user = "ben";
          arch = "aarch64";
          os = "darwin";
        }
      ];

      mkHost = import ./modules/lib/mkHost.nix {
        inherit inputs;
        inherit self;
      };
    in
    {
      darwinConfigurations = nixpkgs.lib.listToAttrs (
        nixpkgs.lib.map mkHost (nixpkgs.lib.filter (h: h.os == "darwin") hosts)
      );

      nixosConfigurations = nixpkgs.lib.listToAttrs (
        nixpkgs.lib.map mkHost (nixpkgs.lib.filter (h: h.os == "linux") hosts)
      );
    };
}
