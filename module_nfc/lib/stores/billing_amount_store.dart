import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/flutter_modular.dart';
import 'package:module_external_dependencies/mobx_triple.dart';
import 'package:module_nfc/view_model/billing_amount_view_model.dart';

class BillingAmountStore extends Store<BillingAmountViewModel> {
  BillingAmountStore() : super(BillingAmountViewModel());

  void onTapNumber(String value) {
    state.currentValues.add(value);
    state.controller.updateValue(_currentValuesToDouble);
    update(state.copyWith(controller: state.controller, currentValues: state.currentValues));
  }

  void clean() {
    state.currentValues.removeLast();
    state.controller.updateValue(_currentValuesToDouble);
    update(state.copyWith(controller: state.controller, currentValues: state.currentValues));
  }

  void goToChargingPage() {
    if (state.controller.text.isNotEmpty)
      Modular.to.pushNamed(NfcRoutes.nfcCharging, arguments: state.controller.text);
  }

  double get _currentValuesToDouble {
    double currentValue = 0;

    String val = state.currentValues.join();
    currentValue = double.parse(val) / 100;

    return currentValue;
  }
}
