{ config, pkgs, lib, ... }:

{
  imports = [
    ../shared/config.nix
  ];

  # Linux-specific system configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  ## Enable X11 windowing system
  #services.xserver = {
  #  enable = true;
  #  layout = "us";
  #  displayManager.gdm.enable = true;
  #  desktopManager.gnome.enable = true;
  #};
}
