import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/flutter_modular.dart';
import 'package:module_external_dependencies/mobx_triple.dart';
import 'package:module_nfc/stores/billing_amount_store.dart';
import 'package:module_nfc/view_model/billing_amount_view_model.dart';
import 'package:module_nfc/widgets/nfc_button_icon_widget.dart';
import 'package:module_nfc/widgets/nfc_number_button_widget.dart';
import 'package:module_nfc/widgets/nfc_render_amount_widget.dart';

class BillingAmountPage extends StatefulWidget {
  const BillingAmountPage({super.key});

  @override
  State<BillingAmountPage> createState() => _BillingAmountPageState();
}

class _BillingAmountPageState extends State<BillingAmountPage> {
  final BillingAmountStore _store = Modular.get<BillingAmountStore>();

  double _getMaxHeight(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height * .52;

    return maxHeight / 5;
  }

  @override
  Widget build(BuildContext context) {
    return NfcScaffoldWidget<BillingAmountStore, BillingAmountViewModel>(
        store: _store,
        body: TripleBuilder<BillingAmountStore, BillingAmountViewModel>(
            store: _store,
            builder: (context, triple) => Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).viewInsets.top + NfcDimens.xxxs,
                    right: NfcDimens.xxs,
                    left: NfcDimens.xxs),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      NfcRenderAmountWidget(amount: _store.state.controller.text),
                      SizedBox(height: NfcDimens.xxxs),
                      Container(
                          height: _getMaxHeight(context),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            NfcNumberButtonWidget(value: '1', onTapButton: _store.onTapNumber),
                            SizedBox(width: NfcDimens.xxxs),
                            NfcNumberButtonWidget(value: '2', onTapButton: _store.onTapNumber),
                            SizedBox(width: NfcDimens.xxxs),
                            NfcNumberButtonWidget(value: '3', onTapButton: _store.onTapNumber),
                          ])),
                      SizedBox(height: NfcDimens.xxxs),
                      Container(
                          height: _getMaxHeight(context),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                            NfcNumberButtonWidget(value: '4', onTapButton: _store.onTapNumber),
                            SizedBox(width: NfcDimens.xxxs),
                            NfcNumberButtonWidget(value: '5', onTapButton: _store.onTapNumber),
                            SizedBox(width: 16),
                            NfcNumberButtonWidget(value: '6', onTapButton: _store.onTapNumber),
                          ])),
                      SizedBox(height: NfcDimens.xxxs),
                      Container(
                          height: _getMaxHeight(context),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                            NfcNumberButtonWidget(value: '7', onTapButton: _store.onTapNumber),
                            SizedBox(width: NfcDimens.xxxs),
                            NfcNumberButtonWidget(value: '8', onTapButton: _store.onTapNumber),
                            SizedBox(width: NfcDimens.xxxs),
                            NfcNumberButtonWidget(value: '9', onTapButton: _store.onTapNumber),
                          ])),
                      SizedBox(height: NfcDimens.xxxs),
                      Container(
                          height: _getMaxHeight(context),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                            NfcNumberIconWidget(onTapButton: _store.clean, icon: Icons.backspace_outlined),
                            SizedBox(width: NfcDimens.xxxs),
                            NfcNumberButtonWidget(value: '0', onTapButton: _store.onTapNumber),
                            SizedBox(width: NfcDimens.xxxs),
                            NfcNumberIconWidget(onTapButton: _store.goToChargingPage, icon: Icons.navigate_next_sharp),
                          ]))
                    ]))));
  }
}
