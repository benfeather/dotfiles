{
  description = "Ben's MacOS and NixOS configurations";

  inputs = {
    darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    homebrew.url = "github:zhaofengli/nix-homebrew";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    sops.url = "github:Mic92/sops-nix";
  };

  outputs =
    inputs@{
      nixpkgs,
      self,
      ...
    }:
    let
      hosts = [
        # Personal Server
        {
          name = "arachne";
          user = "ben";
          arch = "aarch64";
          os = "linux";
          env = {
            domain = "nixos.orb.local";
            pgid = 100;
            puid = 501;
            tz = "Pacific/Auckland";
          };
        }

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
