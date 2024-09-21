{
  description = "Yanis system";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    mynvim.url = "path:../nvim/";
  };

  outputs =
    { nixpkgs, nixpkgs-unstable, ... }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        yanix = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            inherit inputs;
          };
          modules = [ ./configuration.nix ];
        };
      };
    };
}
