import 'package:flutter_modular/flutter_modular.dart';
import 'package:module_commons/commons.dart';
import 'package:module_nfc/pages/billing_amount_page.dart';
import 'package:module_nfc/pages/card_management_page.dart';
import 'package:module_nfc/pages/nfc_charging_page.dart';
import 'package:module_nfc/pages/nfc_payment_reader_page.dart';
import 'package:module_nfc/pages/select_operation_page.dart';
import 'package:module_nfc/stores/billing_amount_store.dart';
import 'package:module_nfc/stores/card_management_store.dart';
import 'package:module_nfc/stores/nfc_charging_store.dart';
import 'package:module_nfc/stores/nfc_payment_reader_store.dart';
import 'package:module_nfc/stores/select_operation_store.dart';

class NfcModule extends Module {
  @override
  void binds(i) {
    // i.addLazySingleton<HomeStore>(HomeStore.new);
    i.add<BillingAmountStore>(BillingAmountStore.new);
    i.add<CardManagementStore>(CardManagementStore.new);
    i.add<NfcChargingStore>(NfcChargingStore.new);
    i.add<NfcPaymentReaderStore>(NfcPaymentReaderStore.new);
    i.add<SelectOperationStore>(SelectOperationStore.new);

    // i.addLazySingleton<ILocalStorage>(LocalStorageService.new);
  }

  @override
  void routes(r) {
    r.child(NfcRoutes.billingAmount, transition: TransitionType.rightToLeft, child: (_) => BillingAmountPage());
    r.child(NfcRoutes.cardManagement, transition: TransitionType.rightToLeft, child: (_) => CardManagementPage());
    r.child(NfcRoutes.nfcCharging, transition: TransitionType.rightToLeft, child: (_) => NfcChargingPage());
    r.child(NfcRoutes.nfcPaymentReader, transition: TransitionType.rightToLeft, child: (_) => NfcPaymentReaderPage());
    r.child(NfcRoutes.selectOperation, child: (_) => SelectOperationPage());
  }
}
