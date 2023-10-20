import 'package:flutter_modular/flutter_modular.dart';
import 'package:module_nfc/modules/nfc_module.dart';


class AppModule extends Module {
  @override
  void binds(i) {

  }

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: NfcModule());
  }
}
