import 'package:module_nfc/controllers/nfc_amount_controller.dart';

class BillingAmountViewModel {
  FoxBitPayMaskController controller = FoxBitPayMaskController(initialValue: 0.00);
  List<String> currentValues = [];

  BillingAmountViewModel copyWith({String? amount, FoxBitPayMaskController? controller, List<String>? currentValues}) {
    return BillingAmountViewModel()
      ..controller = controller ?? this.controller
      ..currentValues = currentValues ?? this.currentValues;
  }
}
