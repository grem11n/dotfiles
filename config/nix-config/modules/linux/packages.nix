{ config, pkgs, ... }:

{
  imports = [
    ../shared/packages.nix
  ];

  # Linux-specific packages
  environment.systemPackages = with pkgs; [
    # GUI applications
    firefox
    gnome.gnome-terminal

    # System tools
    gparted
    pavucontrol
  ];
}
