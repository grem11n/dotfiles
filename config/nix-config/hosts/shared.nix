{ config, pkgs, ... }:

{
  # Common configuration for all hosts
  users.users.youruser = {
    name = "yrochniak";
    home = if pkgs.stdenv.isDarwin then "/Users/yrochniak" else "/home/yrochniak";
  };

  # Home-manager configuration
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
}
