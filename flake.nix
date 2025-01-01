{
  description = "Yanis system";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    # mynvim.url = "path:./nvim/";

    # rust toolchain
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty = {
      url = "github:ghostty-org/ghostty";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      fenix,
      ghostty,
      ...
    }@inputs:
    {
      packages.x86_64-linux.default = fenix.packages.x86_64-linux.minimal.toolchain;

      nixosConfigurations.yanix = nixpkgs.lib.nixosSystem {
        specialArgs = rec {
          system = "x86_64-linux";
          inherit inputs;
          pkg_ghostty = ghostty.packages.${system}.default;
        };
        modules = [ ./hosts/yanix/config.nix ];
      };

      nixosConfigurations.ledr-yanix = nixpkgs.lib.nixosSystem {
        specialArgs = rec {
          system = "x86_64-linux";
          inherit inputs;
          pkg_ghostty = ghostty.packages.${system}.default;
        };
        modules = [ ./hosts/ledr-yanix/config.nix ];
      };
    };
}
