{ ... }:
{
  services.xserver.xkb.extraLayouts.qwerty-fr = {
    description = "US keyboard with french symbols - AltGr combination";
    languages = [
      "eng"
      "fr"
    ];
    symbolsFile = /home/yanis/nixos/qwerty-fr;
  };
}
