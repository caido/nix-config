{ pkgs, local, ... }:
{
  home.stateVersion = "25.05";
  home.username = local.username;
  home.homeDirectory = "/Users/${local.username}";
  home.packages = with pkgs; [
		# Chat Apps
		slack

		# AI
		chatgpt

		# Development
		code-cursor
		iterm2
  ];

  imports = [
    ./spotlight-fix.nix
    ./git.nix
    ./zsh.nix
    ./aliases.nix
    ./cursor.nix
  ];
}

