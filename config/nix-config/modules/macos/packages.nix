{ config, pkgs, ... }:

{
  imports = [
    ../shared/packages.nix
  ];

  # MacOS-specific packages
  environment.systemPackages = with pkgs; [
    # GUI applications
    firefox
    floorp

    # Mac-specific tools
    mas # Mac App Store CLI
    m-cli # Swiss Army Knife for macOS
  ];

  # Homebrew configuration (if needed)
  homebrew = {
    enable = true;
    casks = [
      "docker"
      "rectangle"
    ];
  };
}
