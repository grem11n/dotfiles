{ config, pkgs, ... }:

{
  imports = [
    ./shared.nix
    ../modules/macos/config.nix
    ../modules/macos/packages.nix
  ];

  networking.hostName = "intel-mac";
  system.stateVersion = 4;

  # Intel Mac specific configurations
  home-manager.users.youruser = { pkgs, ... }: {
    imports = [ mac-app-util.homeManagerModules.default ];
    home.stateVersion = "24.05";
  };
}
