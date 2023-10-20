import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_nfc/stores/select_operation_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:module_nfc/view_model/select_operation_view_model.dart';

class SelectOperationPage extends StatefulWidget {
  const SelectOperationPage({Key? key}) : super(key: key);

  @override
  State<SelectOperationPage> createState() => _SelectOperationPageState();
}

class _SelectOperationPageState extends State<SelectOperationPage> {
  final SelectOperationStore _store = Modular.get<SelectOperationStore>();

  @override
  Widget build(BuildContext context) {
    return NfcScaffoldWidget<SelectOperationStore, SelectOperationViewModel>(
        store: _store,
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: NfcDimens.xxs),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NfcButtonWidget(
                      onTap: _store.goToBillingAmount,
                      label: "Receber",
                      typeButton: TypeButton.toReceive,
                      padding: EdgeInsets.only(bottom: NfcDimens.xxxs)),
                  NfcButtonWidget(onTap: _store.goToCardManagement, label: "Pagar", typeButton: TypeButton.payment)
                ])));
  }
}
