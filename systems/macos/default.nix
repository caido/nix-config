{ lib, pkgs, local, ... }: {
	system.stateVersion = 6;
	security.pam.services.sudo_local.touchIdAuth = true;
	environment.systemPackages = with pkgs; [
		home-manager
		docker	
		docker-compose
		ripgrep
	];


	nix.settings.experimental-features = [
	  "nix-command"
	   "flakes"
	];
}

