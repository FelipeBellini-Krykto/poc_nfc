import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/flutter_modular.dart';
import 'package:module_external_dependencies/mobx_triple.dart';
import 'package:module_nfc/stores/nfc_payment_reader_store.dart';
import 'package:module_nfc/view_model/nfc_payment_reader_view_model.dart';
import 'package:module_nfc/widgets/nfc_card_item_widget.dart';
import 'package:module_core/models/card_model.dart';

class NfcPaymentReaderPage extends StatefulWidget {
  final CardModel cardModel;

  const NfcPaymentReaderPage({Key? key, required this.cardModel}) : super(key: key);

  @override
  State<NfcPaymentReaderPage> createState() => _NfcPaymentReaderPageState();
}

class _NfcPaymentReaderPageState extends State<NfcPaymentReaderPage> {
  final NfcPaymentReaderStore _store = Modular.get<NfcPaymentReaderStore>();

  @override
  Widget build(BuildContext context) {
    return NfcScaffoldWidget<NfcPaymentReaderStore, NfcPaymentReaderViewModel>(
        store: _store,
        appBar: NfcAppBarWidget(title: "Pagamento"),
        body: TripleBuilder<NfcPaymentReaderStore, NfcPaymentReaderViewModel>(
            store: _store,
            builder: (context, triple) =>
                ListView(shrinkWrap: true, physics: NeverScrollableScrollPhysics(), children: [
                  Icon(Icons.contactless_outlined,
                      color: NfcColors.monoWhite, size: MediaQuery.sizeOf(context).width * 0.2),
                  SizedBox(height: NfcDimens.xxxs),
                  NfcCardItemWidget(card: widget.cardModel)
                ])));
  }
}
