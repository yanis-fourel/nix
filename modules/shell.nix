{ pkgs, ... }:
let
  nushell = pkgs.callPackage ./nushell.nix { };
in
{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "rust"
      ];
    };
  };

  environment.systemPackages = [
    # pkgs.nushell
    nushell
    pkgs.starship
    pkgs.eza
  ];

}
