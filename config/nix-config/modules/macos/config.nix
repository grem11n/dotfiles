{ config, pkgs, lib, ... }:

{
  imports = [
    ../shared/config.nix
  ];

  # MacOS-specific system configuration
  system = {
    defaults = {
      dock = {
        autohide = true;
        minimize-to-application = true;
        show-recents = false;
      };
      finder = {
        AppleShowAllExtensions = true;
        _FXShowPosixPathInTitle = true;
      };
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
      };
    };
  };

  # Enable Touch ID for sudo
  security.pam.enableSudoTouchIdAuth = true;
}
