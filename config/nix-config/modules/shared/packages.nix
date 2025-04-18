{ config, pkgs, ... }:

{
  # Shared packages for all systems
  environment.systemPackages = with pkgs; [
    # Development tools
    git
    vim
    nvim
    neovide # Neovim GUI
    wget
    curl
    ripgrep
    eza
    fzf
    fd
    jq
    yq

    # System tools
    htop
    tree
    tmux

    # Programming languages
    python3
    nodejs
    go
    rust
  ];
}
