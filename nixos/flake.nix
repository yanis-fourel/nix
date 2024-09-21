{
  description = "Yanis system";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    mynvim.url = "path:../nvim/";

    # rust toolchain
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      fenix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      packages.x86_64-linux.default = fenix.packages.x86_64-linux.minimal.toolchain;
      nixosConfigurations.yanix = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit system;
          inherit inputs;
        };
        modules = [ ./configuration.nix ];
      };
    };
}
