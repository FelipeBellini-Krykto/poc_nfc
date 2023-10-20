import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/mobx_triple.dart';
import 'package:module_nfc/view_model/nfc_charging_view_model.dart';

class NfcChargingStore extends Store<NfcChargingViewModel> {
  NfcChargingStore() : super(NfcChargingViewModel());

  void createTagWithAmount(String amount) async {
    bool nfcIsAvailable = await NfcHelper.NfcIsAvailable();
    if (nfcIsAvailable) {
      NfcHelper.startSession(amount);
    } else {
      print("sem permissão");
    }
  }
}
