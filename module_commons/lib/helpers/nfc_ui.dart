import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NfcAppUI {
  static final NfcAppUI _instance = NfcAppUI._internal();

  factory NfcAppUI() {
    return _instance;
  }

  NfcAppUI._internal();

  static ScrollPhysics get bouncingPhysics => const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());

  static void setPortraitOrientation() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}
