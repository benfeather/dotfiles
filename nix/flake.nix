{
  description = "Ben's nix-darwin system flake";

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
    configuration = { pkgs, config, ... }: {
      environment = {
        systemPackages = [
          pkgs.oh-my-zsh
          pkgs.zsh
          pkgs.zsh-powerlevel10k
        ];
      };

      homebrew = {
        enable = true;

        onActivation = {
          autoUpdate = true;
          cleanup = "zap";
          upgrade = true;
        };

        brews = [
          "ddev"
          "docker"
          "docker-compose"
          "git"
          "mkcert"
        ];

        casks = [
          "adguard"
          "arc"
          "brave-browser"
          "crossover"
          "cyberduck"
          "firefox@developer-edition"
          "font-adwaita"
          "font-fira-code"
          "font-open-sans"
          "font-roboto"
          "github"
          "godot"
          "google-chrome"
          "orbstack"
          "setapp"
          "sequel-ace"
          "spotify"
          "visual-studio-code"
          "warp"
        ];

        masApps = {
          "affinity-designer" = 1616831348;
          "affinity-photo" = 1616822987;
          "whatsapp" = 310633997;
          "unarchiver" = 425424353;
          "xcode" = 497799835;
        };

        taps = [
          "ddev/ddev"
        ];
      };

      nix = {
        settings = {
          experimental-features = "nix-command flakes";
        };
      };
      
      nixpkgs = {
        config = {
          allowUnfree = true;
        };
        hostPlatform = "aarch64-darwin";
      };

      programs = {
        bash.enable = false;

        fish.enable = false;

        zsh = {
          enable = true;
          enableCompletion = true;
        };
      };

      system = {
        defaults = {
          dock = {
            autohide = true;
            autohide-delay = 0.2;
            mineffect = "scale";
            mru-spaces = false;
            launchanim = false;
            orientation = "bottom";
            show-recents = false;
            wvous-bl-corner = 1;
            wvous-br-corner = 1;
            wvous-tl-corner = 1;
            wvous-tr-corner = 1;
          };

          finder = {
            _FXSortFoldersFirst = true;
            _FXSortFoldersFirstOnDesktop = true;
            AppleShowAllExtensions = true;
            AppleShowAllFiles = false;
            FXEnableExtensionChangeWarning = false;
            FXPreferredViewStyle = "clmv";
            NewWindowTarget = "Home";
            ShowPathbar = true;
            ShowStatusBar = true;
          };

          loginwindow = {
            GuestEnabled = false;
          };

          magicmouse = {
            MouseButtonMode = "TwoButton";
          };

          SoftwareUpdate = {
            AutomaticallyInstallMacOSUpdates = true;
          };

          spaces = {
            spans-displays = false;
          };

          trackpad = {
            Clicking = true;
          };
        };

        keyboard = {
          enableKeyMapping = true;
        };

        # Set Git commit hash for darwin-version.
        configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        stateVersion = 6;
      };

      users = {
        users = {
          ben = {
            shell = pkgs.zsh;
          };
        };
      };
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "ben";
          };
        }
      ];
    };
  };
}
