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

      mkHost = host:
        let
          builder = if host.os == "darwin" then darwin.lib.darwinSystem else nixpkgs.lib.nixosSystem;
        in
          {
            name = host.hostname;
            value = builder {
              system = "${host.arch}-${host.os}";
              modules = [
                ./modules/common/default.nix
                ./modules/common/${host.os}.nix
                ./hosts/${host.os}/${host.hostname}.nix
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
