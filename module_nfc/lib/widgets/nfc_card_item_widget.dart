import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_core/models/card_model.dart';

class NfcCardItemWidget extends StatelessWidget {
  final CardModel card;

  const NfcCardItemWidget({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: NfcDimens.lg,
        margin: EdgeInsets.only(left: NfcDimens.xxxs, right: NfcDimens.xxxs, bottom: NfcDimens.xxxs),
        decoration: BoxDecoration(
            color: NfcColors.megaMenuButton, borderRadius: BorderRadius.all(Radius.circular(NfcDimens.nano))),
        child: Column(children: [
          const Spacer(),
          Text("Chave Pública: ${NfcAppUI.shortKey(card.publicKey)}",
              style: TextStyle(fontSize: 14, color: NfcColors.monoWhite)),
          const Spacer(),
          Text("Chave Privada: ${NfcAppUI.shortKey(card.privateKey)}",
              style: TextStyle(fontSize: 14, color: NfcColors.monoWhite)),
          const Spacer(),
        ]));
  }
}
