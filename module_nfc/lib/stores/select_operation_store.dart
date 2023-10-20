import 'package:module_commons/commons.dart';
import 'package:module_nfc/view_model/select_operation_view_model.dart';
import 'package:module_external_dependencies/mobx_triple.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SelectOperationStore extends Store<SelectOperationViewModel> {
  SelectOperationStore() : super(SelectOperationViewModel());

  void goToCardManagement() => Modular.to.pushNamed(NfcRoutes.cardManagement);

  void goToBillingAmount() => Modular.to.pushNamed(NfcRoutes.billingAmount);
}
