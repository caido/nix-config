{
  description = "OS-agnostic Nix config";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-25.05";
    nix-darwin.url   = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager, ... }@inputs:

  let
    local = import ./local.nix;

  in {
    # System configurations
    darwinConfigurations.macos = nix-darwin.lib.darwinSystem {
        system  = local.system;
        specialArgs = { inherit inputs local; };
        modules = [
          { _module.args = { inherit local; }; } 
          { nixpkgs.config.allowUnfree = true; }
          ./systems/macos                      
        ];
      };

    # Home configurations
    homeConfigurations."user@macos" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${local.system};
      modules = [
        { _module.args = { inherit local; }; }
        { nixpkgs.config.allowUnfree = true; }
        ./home/macos
      ];
    };
  };
}

