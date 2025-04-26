{
  description = "Ben's NixOS and macOS configurations";

  inputs = {
    nix-darwin = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-darwin/nix-darwin/master";
    };

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = inputs@{ self, nix-darwin, nix-homebrew, nixpkgs, home-manager }: 
    let
      ROOT_DIR = "/Users/ben/Dotfiles/nix";
    in {
      darwinConfigurations = builtins.listToAttrs (
        map (hostname: {
          name = hostname;
          value = nix-darwin.lib.darwinSystem {
            modules = [
              "${ROOT_DIR}/hosts/common"
              "${ROOT_DIR}/hosts/darwin/common"
              "${ROOT_DIR}/hosts/darwin/${hostname}" 
            ];
            specialArgs = { inherit inputs; };
          };
        }) (builtins.attrNames (builtins.readDir "${ROOT_DIR}/hosts/darwin"))
      );
    };
}
