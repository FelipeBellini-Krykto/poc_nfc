import 'package:module_external_dependencies/mobx_triple.dart';
import 'package:module_nfc/view_model/nfc_payment_reader_view_model.dart';

class NfcPaymentReaderStore extends Store<NfcPaymentReaderViewModel> {
  NfcPaymentReaderStore() : super(NfcPaymentReaderViewModel());
}
