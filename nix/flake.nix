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
        in
          {
            name = host.name;
            value = builder {
              system = "${host.arch}-${host.os}";
              modules = [
                ./modules/common/default.nix
                ./modules/common/${host.os}.nix
                ./hosts/${host.os}/${host.name}.nix
              ];
              specialArgs = {
                inherit host;
                inherit inputs;
              };
            };
          };
    in
    {
      darwinConfigurations = builtins.listToAttrs (
        map (host: mkHost host)
        (builtins.filter (h: h.os == "darwin") hosts)
      );

      nixosConfigurations = builtins.listToAttrs (
        map (host: mkHost host)
        (builtins.filter (h: h.os == "linux") hosts)
      );
    };
}
