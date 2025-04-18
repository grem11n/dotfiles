{ config, pkgs, ... }:

{
  imports = [
    ./shared.nix
    ../modules/macos/config.nix
    ../modules/macos/packages.nix
  ];

  networking.hostName = "m-mac";
  system.stateVersion = 4;

  # Apple Silicon specific configurations
  home-manager.users.youruser = { pkgs, ... }: {
    imports = [ mac-app-util.homeManagerModules.default ];
    home.stateVersion = "24.05";
  };
}
