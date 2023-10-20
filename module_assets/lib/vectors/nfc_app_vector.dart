enum NfcAppImageVector {
  ic_clean,
  ic_nfc,
}

extension ImageVectorExtension on NfcAppImageVector {
  String get svg => "vector/$name.svg";

  String get package => "module_assets";
}
