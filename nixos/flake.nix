{
  description = "Yanis system";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    mynvim.url = "path:../nvim/";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, mynvim, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    in {
      nixosConfigurations = {
        yanix = lib.nixosSystem {
          modules = [ ./configuration.nix ];
          extraArgs = {
            inherit system;
            inherit mynvim;
            inherit pkgs-unstable;
          };
        };
      };
    };
}
