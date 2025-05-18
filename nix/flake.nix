{
  description = "Ben's MacOS and NixOS configurations";

  inputs = {
    darwin.url = "github:nix-darwin/nix-darwin/master";
    home-manager.url = "github:nix-community/home-manager";
    homebrew.url = "github:zhaofengli/nix-homebrew";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = inputs@{ self, darwin, home-manager, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;

      hosts = [
        {
          name = "kitsune";
          user = "ben";
          arch = "aarch64";
          os = "darwin";
        }
        {
          name = "fennec";
          user = "ben";
          arch = "x86_64";
          os = "linux";
        }
      ];

      mkHost = host:
        let
          builder = if host.os == "darwin" then darwin.lib.darwinSystem else nixpkgs.lib.nixosSystem;
          homeManagerModule = if host.os == "darwin" then home-manager.darwinModules.home-manager else home-manager.nixosModules.home-manager;
        in
          {
            name = host.name;
            value = builder {
              system = "${host.arch}-${host.os}";
              modules = [
                ./modules/shared/default.nix
                ./modules/${host.os}/default.nix
                ./hosts/${host.os}/${host.name}.nix
                homeManagerModule
                {
                  home-manager.useGlobalPkgs = true;
                  home-manager.useUserPackages = true;
                  home-manager.users.${host.user} = import ./modules/home/${host.user}/default.nix;
                }
              ];
              specialArgs = {
                inherit host;
                inherit inputs;
              };
            };
          };
    in
    {
      darwinConfigurations = lib.listToAttrs (
        lib.map mkHost (lib.filter (h: h.os == "darwin") hosts)
      );

      nixosConfigurations = lib.listToAttrs (
        lib.map mkHost (lib.filter (h: h.os == "linux") hosts)
      );
    };
}
