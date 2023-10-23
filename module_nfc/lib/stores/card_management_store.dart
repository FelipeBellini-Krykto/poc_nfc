import 'dart:convert';

import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/mobx_triple.dart';
import 'package:module_nfc/view_model/card_management_view_model.dart';
import 'package:module_core/models/card_model.dart';

class CardManagementStore extends Store<CardManagementViewModel> {
  CardManagementStore() : super(CardManagementViewModel());

  void createNewCard() async {
    state.listCard.add(NfcGenerateRSA.getRsaKeyPair());
    update(state.copyWith(cards: state.listCard));
    List<Map<String, dynamic>> cardMapList = state.listCard.map((card) => card.toMap()).toList();
    String jsonPairKeys = json.encode(cardMapList);

  }

  void openCardForPayment(CardModel card) {

  }
}
