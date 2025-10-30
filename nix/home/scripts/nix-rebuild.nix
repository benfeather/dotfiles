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

    print_header "System Upgrade"

    # Detect the operating system and rebuild
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
      # Check if this is a NixOS system
      if [ -f /etc/NIXOS ]; then
        print_step "Rebuilding NixOS configuration..."
        sudo nixos-rebuild switch --flake "$FLAKE_PATH" --upgrade
      else
        print_error "Linux detected but not running NixOS"
        exit 1
      fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
      print_step "Rebuilding Darwin configuration..."
      sudo darwin-rebuild switch --flake "$FLAKE_PATH"
      
      # Check if Homebrew is installed
      if command -v brew &> /dev/null; then
        print_step "Updating Homebrew..."
        if brew update &> /dev/null; then
          print_success "Homebrew updated"
        else
          print_error "Homebrew update failed"
          exit 1
        fi
        
        print_step "Upgrading Homebrew packages..."
        if brew upgrade &> /dev/null; then
          print_success "Homebrew packages upgraded"
        else
          print_error "Homebrew upgrade failed"
          exit 1
        fi
        
        print_step "Cleaning up Homebrew..."
        if brew cleanup &> /dev/null; then
          print_success "Homebrew cleanup completed"
        else
          print_error "Homebrew cleanup failed"
          exit 1
        fi
      else
        echo ""
        print_warning "Homebrew not found, skipping..."
      fi
    else
      print_error "Unsupported operating system: $OSTYPE"
      exit 1
    fi

    print_header "Upgrade Complete"
  '';
in
{
  home.packages = [ nix-rebuild ];
}
