{
  description = "Yanis system";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    mynvim.url = "path:./nvim/";

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
    let
      system = "x86_64-linux";
      host = "yanix";
      pkg_ghostty = ghostty.packages.${system}.default;
    in
    {
      packages.x86_64-linux.default = fenix.packages.x86_64-linux.minimal.toolchain;
      nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit system;
          inherit inputs;
          inherit pkg_ghostty;
        };
        modules = [ ./hosts/${host}/config.nix ];
      };
    };
}
