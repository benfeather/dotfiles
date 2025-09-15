# Ben's Dotfiles

## Mac

### 1. Install Xcode:

`xcode-select --install`

### 2. Install Brew:

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

### 3. Install Nix:

`sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)`

### 4. Clone this repo:

`git clone https://github.com/benfeather/dotfiles.git ~/Dotfiles`

### 5. Initial Build:

`sudo nix run nix-darwin --extra-experimental-features "flakes nix-command" -- switch --flake ~/Dotfiles/nix#hostname`

### 6. Subsequent Builds:

`sudo darwin-rebuild switch --flake ~/Dotfiles/nix`

## Linux

WIP
