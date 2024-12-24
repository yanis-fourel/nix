{ ... }:
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
}
