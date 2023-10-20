import 'package:flutter/material.dart';
import 'package:module_assets/vectors/nfc_app_vector.dart';
import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/flutter_modular.dart';
import 'package:module_external_dependencies/flutter_svg.dart';
import 'package:module_external_dependencies/mobx_triple.dart';
import 'package:module_nfc/stores/nfc_charging_store.dart';
import 'package:module_nfc/view_model/nfc_charging_view_model.dart';
import 'package:module_nfc/widgets/nfc_render_amount_widget.dart';

class NfcChargingPage extends StatefulWidget {
  final String value;

  const NfcChargingPage({Key? key, required this.value}) : super(key: key);

  @override
  State<NfcChargingPage> createState() => _NfcChargingPageState();
}

class _NfcChargingPageState extends State<NfcChargingPage> {
  final NfcChargingStore _store = Modular.get<NfcChargingStore>();

  @override
  Widget build(BuildContext context) {
    return NfcScaffoldWidget<NfcChargingStore, NfcChargingViewModel>(
        store: _store,
        body: TripleBuilder<NfcChargingStore, NfcChargingViewModel>(
            store: _store,
            builder: (_, triple) => Column(children: [
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).viewInsets.top + NfcDimens.xxs,
                          right: NfcDimens.xxs,
                          left: NfcDimens.xxs),
                      child: NfcRenderAmountWidget(amount: widget.value)),
                  const Spacer(),
                  SvgPicture.asset(NfcAppImageVector.ic_nfc.svg,
                      package: NfcAppImageVector.ic_nfc.package,
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      color: NfcColors.disabledGray),
                  Text("Tag gerada para pagamento",
                      style: TextStyle(fontWeight: FontWeight.w600, color: NfcColors.monoWhite, fontSize: 20)),
                  const Spacer(),
                ])));
  }
}
