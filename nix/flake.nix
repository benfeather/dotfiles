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
  };

  outputs =
    inputs@{
      darwin,
      home,
      nixpkgs,
      self,
      ...
    }:
    let
      lib = nixpkgs.lib;

      hosts = [
        # Work Laptop
        {
          name = "arachne";
          user = "benfeather";
          arch = "aarch64";
          os = "darwin";
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
        # Personal Server
        {
          name = "qinglong";
          user = "ben";
          arch = "aarch64";
          os = "linux";
        }
      ];

      mkHost =
        host:
        let
          builder = if host.os == "darwin" then darwin.lib.darwinSystem else nixpkgs.lib.nixosSystem;
          homeDirectory = if host.os == "darwin" then "/Users/${host.user}" else "/home/${host.user}";
          homeManager =
            if host.os == "darwin" then home.darwinModules.home-manager else home.nixosModules.home-manager;
        in
        {
          name = host.name;
          value = builder {
            system = "${host.arch}-${host.os}";
            modules = [
              ./modules/shared/default.nix
              ./modules/shared/${host.os}.nix
              ./hosts/${host.os}/${host.name}/configuration.nix
              homeManager
            ];
            specialArgs = {
              inherit homeDirectory;
              inherit host;
              inherit inputs;
            };
          };
        };
    in
    {
      darwinConfigurations = lib.listToAttrs (lib.map mkHost (lib.filter (h: h.os == "darwin") hosts));

      nixosConfigurations = lib.listToAttrs (lib.map mkHost (lib.filter (h: h.os == "linux") hosts));
    };
}
