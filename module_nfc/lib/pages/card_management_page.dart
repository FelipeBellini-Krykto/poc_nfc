import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/flutter_modular.dart';
import 'package:module_external_dependencies/mobx_triple.dart';
import 'package:module_nfc/stores/card_management_store.dart';
import 'package:module_nfc/view_model/card_management_view_model.dart';

class CardManagementPage extends StatefulWidget {
  const CardManagementPage({super.key});

  @override
  State<CardManagementPage> createState() => _CardManagementPageState();
}

class _CardManagementPageState extends State<CardManagementPage> {
  final CardManagementStore _store = Modular.get<CardManagementStore>();

  @override
  Widget build(BuildContext context) {
    return NfcScaffoldWidget<CardManagementStore, CardManagementViewModel>(
        store: _store,
        appBar: NfcAppBarWidget(title: "Cartões"),
        floatingActionButton: NfcFABWidget(onTap: _store.createNewCard),
        body: TripleBuilder<CardManagementStore, CardManagementViewModel>(
            store: _store,
            builder: (context, triple) => ListView.builder(
                  itemBuilder: (_, int index) {
                    return Container(
                        height: 80, margin: EdgeInsets.symmetric(horizontal: NfcDimens.xxxs), color: Colors.black);
                  },
                  itemCount: 3,
                )));
  }
}
