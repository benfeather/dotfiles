{ lib, inputs, ... }:

let
  utils = import ./utils.nix { inherit lib; };
  inherit (utils) isDarwin isLinux;
in {
  mkHost = hostConfig@{ hostname, platform, system, username, ... }:
    let
      hostDarwin = isDarwin system;

      systemBuilder = if hostDarwin then
        inputs.darwin.lib.darwinSystem
      else
        inputs.nixpkgs.lib.nixosSystem;

    in 
      systemBuilder {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [ 
          ../modules/common/default.nix 
          ../modules/${platform}/default.nix 
          ../hosts/${platform}/${hostname}/default.nix 
        ];
      };
}