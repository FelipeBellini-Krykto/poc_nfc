import 'package:module_core/models/card_model.dart';

class CardManagementViewModel {
  List<CardModel> listCard = [];

  CardManagementViewModel copyWith({List<CardModel>? cards}) {
    return CardManagementViewModel()..listCard = cards ?? this.listCard;
  }
}
