import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_commons/helpers/nfc_masked_helper.dart';

class NfcRenderAmountWidget extends StatelessWidget {
  final String amount;

  const NfcRenderAmountWidget({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: NfcDimens.xxs),
        height: NfcDimens.xxhuge,
        padding: EdgeInsets.only(left: NfcDimens.xxs, right: NfcDimens.xxs),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(NfcDimens.xxxs)),
            border: Border.fromBorderSide(BorderSide(width: 4, color: NfcColors.neutralGraySeven)),
            shape: BoxShape.rectangle,
            color: NfcColors.megaMenuButton),
        child: Text(amount,
            style: TextStyle(fontSize: NfcDimens.xxs, color: Colors.white, fontWeight: FontWeight.w600)));
  }
}
