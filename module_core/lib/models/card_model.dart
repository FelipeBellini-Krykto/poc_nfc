import 'dart:convert';

class CardModel {
  final String publicKey;
  final String privateKey;

  CardModel({
    required this.publicKey,
    required this.privateKey,
  });

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "publicKey": publicKey,
      "privateKey": privateKey,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      publicKey: map["publicKey"] ?? "",
      privateKey: map["privateKey"] ?? "",
    );
  }
}
