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
        {
          name = "fenrir";
          description = "Ben's PC";
          user = "ben";
          arch = "x86_64";
          os = "linux";
        }
        {
          name = "kitsune";
          description = "Ben's MacBook";
          user = "ben";
          arch = "aarch64";
          os = "darwin";
        }
      ];

      mkHost = import ./lib/mkHost.nix {
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
