{
  pkgs,
  ...
}:
let
  nix-rebuild = pkgs.writeShellScriptBin "nix-rebuild" ''
    FLAKE_PATH="$HOME/Dotfiles/nix"
    print_divider() {
      echo "========================================"
    }
    print_header() {
      echo ""
      print_divider
      echo "  $1"
      print_divider
    }
    print_step() {
      echo ""
      echo ">> $1"
    }
    print_success() {
      echo "   Success: $1"
    }
    print_error() {
      echo "   Error: $1"
    }
    print_warning() {
      echo "   Warning: $1"
    }
    print_header "System Rebuild"
    # Detect the operating system and rebuild
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
      # Check if this is a NixOS system
      if [ -f /etc/NIXOS ]; then
        print_step "Rebuilding NixOS configuration..."
        sudo nixos-rebuild switch --flake "$FLAKE_PATH"
      else
        print_error "Linux detected but not running NixOS"
        exit 1
      fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
      print_step "Rebuilding Darwin configuration..."
      sudo darwin-rebuild switch --flake "$FLAKE_PATH"
    else
      print_error "Unsupported operating system: $OSTYPE"
      exit 1
    fi
    print_header "Rebuild Complete"
  '';
in
{
  home.packages = [ nix-rebuild ];
}
