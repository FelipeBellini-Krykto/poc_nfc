import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/flutter_modular.dart';
import 'package:module_external_dependencies/mobx_triple.dart';
import 'package:module_nfc/stores/card_management_store.dart';
import 'package:module_nfc/view_model/card_management_view_model.dart';
import 'package:module_nfc/widgets/nfc_card_item_widget.dart';

class CardManagementPage extends StatefulWidget {
  const CardManagementPage({super.key});

  @override
  State<CardManagementPage> createState() => _CardManagementPageState();
}

class _CardManagementPageState extends State<CardManagementPage> {
  final CardManagementStore _store = Modular.get<CardManagementStore>();

  @override
  void initState() {
    _store.getMyCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NfcScaffoldWidget<CardManagementStore, CardManagementViewModel>(
        store: _store,
        appBar: NfcAppBarWidget(title: "Cartões"),
        floatingActionButton: NfcFABWidget(onTap: _store.createNewCard),
        body: TripleBuilder<CardManagementStore, CardManagementViewModel>(
            store: _store,
            builder: (context, triple) => Visibility(
                visible: _store.state.listCard.length != 0,
                child: ListView.builder(
                    padding: EdgeInsets.only(top: NfcDimens.xxxs),
                    itemBuilder: (_, int index) => GestureDetector(
                        onTapDown: (_) => _store.openCardForPayment(_store.state.listCard[index]),
                        child: NfcCardItemWidget(card: _store.state.listCard[index])),
                    itemCount: _store.state.listCard.length),
                replacement: Center(
                    child: Text("Você não tem nenhum cartão no momento...",
                        style: TextStyle(color: NfcColors.monoWhite, fontSize: 16))))));
  }
}
