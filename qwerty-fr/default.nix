{
  lib,
  stdenv,
  xkeyboard_config,
}:

stdenv.mkDerivation {
  name = "xkb-qwerty-fr";
  src = ./qwerty-fr.xkb;

  buildInputs = [ xkeyboard_config ];

  # Override the unpack phase since this is a plain file, not an archive
  unpackPhase = ":";

  installPhase = ''
    mkdir -p $out/usr/share/X11/xkb/symbols
    cp $src $out/usr/share/X11/xkb/symbols/us_qwerty-fr
  '';

  meta = with lib; {
    description = "US keyboard with french symbols - AltGr combination";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
