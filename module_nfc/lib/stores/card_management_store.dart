import 'dart:convert';

import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/mobx_triple.dart';
import 'package:module_nfc/view_model/card_management_view_model.dart';
import 'package:module_core/models/card_model.dart';
import 'package:module_core/services/local_storage_service/interface/local_storage_interface.dart';
import 'package:module_core/utils/storage_keys.dart';

class CardManagementStore extends Store<CardManagementViewModel> {
  final ILocalStorage localStorage;

  CardManagementStore({required this.localStorage}) : super(CardManagementViewModel());

  void getMyCards() async {
    var json = await localStorage.get(CARDS);
    List<dynamic> jsonList = jsonDecode(json);
    List<CardModel> cardList = jsonList.map((item) => CardModel.fromMap(item)).toList();

    update(state.copyWith(cards: cardList));
  }

  void createNewCard() async {
    state.listCard.add(NfcGenerateRSA.getRsaKeyPair());
    update(state.copyWith(cards: state.listCard));
    List<Map<String, dynamic>> cardMapList = state.listCard.map((card) => card.toMap()).toList();
    String jsonPairKeys = json.encode(cardMapList);
    localStorage.put(CARDS, jsonPairKeys);
  }

  void openCardForPayment(CardModel card) {}
}
