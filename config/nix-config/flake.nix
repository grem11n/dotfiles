{
  description = "Multi-platform Nix Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Mac-specific inputs
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Home-manager
    home-manager.url = "github:nix-home/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Mac App Util for proper Spotlight integration
    mac-app-util.url = "github:hraban/mac-app-util";
  };

  outputs = inputs @ { self, nixpkgs, darwin, home-manager, mac-app-util, ... }:
    let
      supportedSystems = [ "x86_64-linux" "x86_64-darwin" "aarch64-darwin" ];

      # Helper function to generate system-specific configurations
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      # Overlays
      overlays = [ ];
    in
    {
      darwinConfigurations = {
        # Intel MacBook
        "intel-mac" = darwin.lib.darwinSystem {
          system = "x86_64-darwin";
          modules = [
            mac-app-util.darwinModules.default
            home-manager.darwinModules.home-manager
            ./hosts/intel-mac.nix
          ];
          specialArgs = { inherit inputs; };
        };

        # Apple Silicon MacBook
        "m-mac" = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            mac-app-util.darwinModules.default
            home-manager.darwinModules.home-manager
            ./hosts/m-mac.nix
          ];
          specialArgs = { inherit inputs; };
        };
      };

      # NixOS Configuration for Fedora
      nixosConfigurations = {
        "fedora-linux" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            home-manager.nixosModules.home-manager
            ./hosts/fedora-linux.nix
          ];
          specialArgs = { inherit inputs; };
        };
      };
    };
}
