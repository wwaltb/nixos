{
    description = "Nixos config flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, ... }@inputs: 
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
        in
            {
            nixosConfigurations.jonsbo6 = nixpkgs.lib.nixosSystem {
                system = system;
                specialArgs = {inherit inputs;};
                modules = [
                    ./hosts/jonsbo6/configuration.nix
                    ./modules/nixos/default.nix
                ];
            };
        };
}
