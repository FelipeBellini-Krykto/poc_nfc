import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/mobx_triple.dart';
import 'package:module_nfc/view_model/nfc_payment_reader_view_model.dart';

class NfcPaymentReaderStore extends Store<NfcPaymentReaderViewModel> {
  NfcPaymentReaderStore() : super(NfcPaymentReaderViewModel());

  @override
  void initStore() {
    _readTagNFC();
    super.initStore();
  }

  _readTagNFC() async {
    String? keyReceived = await NfcHelper.listenerTag();
    print(keyReceived);
    update(state.copyWith(response: keyReceived??""));
  }
}
