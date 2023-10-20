import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/pointycastle.dart';
import 'package:module_external_dependencies/mobx_triple.dart';
import 'package:module_nfc/view_model/card_management_view_model.dart';
import 'package:module_external_dependencies/pointycastle.dart';

class CardManagementStore extends Store<CardManagementViewModel> {
  CardManagementStore() : super(CardManagementViewModel());

  void createNewCard() async {
    NfcGenerateRSA.getRsaKeyPair();

  }
}
