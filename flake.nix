{
  description = "Home Manager configuration of tom";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
  };

  outputs = { nixpkgs, home-manager, ... }: {
    homeConfigurations = {
      tom = home-manager.lib.homeManagerConfiguration {
        inherit nixpkgs;
        modules = [
          ./home.nix
        ];
      };
    };
  };
}

