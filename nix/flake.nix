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
      hosts = [
        {
          hostname = "kitsune";
          arch = "aarch64";
          username = "ben";
          os = "darwin";
        }
        {
          hostname = "fennec";
          arch = "x86_64";
          username = "ben";
          os = "linux";
        }
      ];
    in
    {
      darwinConfigurations = builtins.listToAttrs (
        map (host: {
          name = host.hostname;
          value = darwin.lib.darwinSystem {
            system = "${host.arch}-${host.os}";
            modules = [
              ./modules/common/default.nix
              ./modules/common/darwin.nix
              ./hosts/darwin/${host.hostname}.nix
            ];
            specialArgs = {
              inherit host;
              inherit inputs;
            };
          };
        })
        (builtins.filter (h: h.os == "darwin") hosts)
      );

      nixosConfigurations = builtins.listToAttrs (
        map (host: {
          name = host.hostname;
          value = nixpkgs.lib.nixosSystem {
            system = "${host.arch}-${host.os}";
            modules = [
              ./modules/common/default.nix
              ./modules/common/linux.nix
              ./hosts/linux/${host.hostname}.nix
            ];
            specialArgs = {
              inherit host;
              inherit inputs;
            };
          };
        })
        (builtins.filter (h: h.os == "linux") hosts)
      );
    };
}
