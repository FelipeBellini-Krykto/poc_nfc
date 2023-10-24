class NfcPaymentReaderViewModel {
  String valueResponse = "";
  NfcPaymentReaderViewModel copyWith({required String response}) {
    return NfcPaymentReaderViewModel()..valueResponse = response;
  }
}
