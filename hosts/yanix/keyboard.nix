{ ... }:
{
  services.xserver.xkb.extraLayouts.qwerty-fr = {
    description = "Variant of qwerty with extra symbols and diacritics so that typing both in French and English is easy and fast";
    languages = [
      "eng"
      "fr"
    ];
    symbolsFile = /home/yanis/nixos/qwerty-fr;
  };
}
