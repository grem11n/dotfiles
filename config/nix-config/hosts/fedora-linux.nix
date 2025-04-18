{ config, pkgs, ... }:

{
  imports = [
    ./shared.nix
    ../modules/linux/config.nix
    ../modules/linux/packages.nix
  ];

  networking.hostName = "fedora-linux";
  system.stateVersion = "24.05";

  # Fedora specific configurations
  home-manager.users.youruser = {
    home.stateVersion = "24.05";
  };
}
