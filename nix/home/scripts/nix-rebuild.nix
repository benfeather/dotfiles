{
  pkgs,
  ...
}:
let
  nix-rebuild = pkgs.writeShellScriptBin "nix-rebuild" ''
    FLAKE_PATH="$HOME/Dotfiles/nix"

    # Colors for output
    BLUE='\033[0;34m'
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    NC='\033[0m' # No Color

    print_header() {
      echo ""
      echo -e "$BLUE━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
      echo -e "$BLUE  $1$NC"
      echo -e "$BLUE━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
      echo ""
    }

    print_step() {
      echo -e "$GREEN▶$NC $1"
    }

    print_header "System Upgrade"

    # Update Nix flake inputs
    print_step "Updating Nix flake inputs..."
    nix flake update "$FLAKE_PATH"

    # Detect the operating system and rebuild
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
      # Check if this is a NixOS system
      if [ -f /etc/NIXOS ]; then
        print_step "Rebuilding NixOS configuration..."
        sudo nixos-rebuild switch --flake "$FLAKE_PATH" --upgrade
      else
        echo "Error: Linux detected but not running NixOS"
        exit 1
      fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
      print_step "Rebuilding Darwin configuration..."
      sudo darwin-rebuild switch --flake "$FLAKE_PATH"
      
      # Check if Homebrew is installed
      if command -v brew &> /dev/null; then
        echo ""

        print_step "Updating Homebrew..."
        brew update
        
        print_step "Upgrading Homebrew packages..."
        brew upgrade
        
        print_step "Cleaning up Homebrew..."
        brew cleanup
      else
        echo ""
        echo -e "$YELLOW⚠ Homebrew not found, skipping...$NC"
      fi
    else
      echo "Error: Unsupported operating system: $OSTYPE"
      exit 1
    fi

    echo ""
    echo -e "$GREEN✓ All upgrades completed successfully!$NC"
    echo ""
  '';
in
{
  home.packages = [ nix-rebuild ];
}
