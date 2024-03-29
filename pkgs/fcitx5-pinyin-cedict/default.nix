{ lib
, stdenvNoCC
, fetchurl
}:

stdenvNoCC.mkDerivation {
  pname = "fcitx5-pinyin-cedict";
  version = "20210516";

  src = fetchurl {
    url = "https://github.com/cathaysia/fcitx5_dicts/releases/download/0.0.1/cedict.dict";
    hash = "sha256-1FaHp9+f49J9Y/750ye+ulUb6q5rfwHKJl1Sdj7AtUg=";
  };

  dontUnpack = true;

  installPhase = ''
    install -Dm644 $src $out/share/fcitx5/pinyin/dictionaries/fcitx5-pinyin-cedict.dict
  '';

  meta = with lib; {
    description = "High-quality chinese dictionaries generated by cedi with 10,564 phrases in total (no auto update)";
    homepage = "https://github.com/cathaysia/fcitx5_dicts";
    license = licenses.mit;
  };
}
