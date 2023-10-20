import 'package:module_external_dependencies/mobx_triple.dart';
import 'package:module_nfc/view_model/card_management_view_model.dart';

class CardManagementStore extends Store<CardManagementViewModel> {
  CardManagementStore() : super(CardManagementViewModel());
}
