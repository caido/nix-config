{ pkgs, local, ... }:
{
  home.stateVersion = "25.05";
  home.username = local.username;
  home.homeDirectory = "/Users/${local.username}";

  imports = [
    ./spotlight-fix.nix
    ./git.nix
    ./zsh.nix
    ./aliases.nix
  ];
}

