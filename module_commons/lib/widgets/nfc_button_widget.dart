import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';

enum TypeButton { toReceive, payment, create }

class NfcButtonWidget extends StatelessWidget {
  final Function() onTap;
  final String label;
  final TypeButton typeButton;
  final EdgeInsets? padding;

  const NfcButtonWidget(
      {Key? key, required this.onTap, required this.label, required this.typeButton, this.padding = EdgeInsets.zero})
      : super(key: key);

  Color get _backgroundButton {
    switch (typeButton) {
      case TypeButton.payment:
        return NfcColors.errorFiveHundred;
      case TypeButton.toReceive:
        return NfcColors.successFourHundred;
      case TypeButton.create:
        return NfcColors.primaryColor;

      default:
        return NfcColors.monoWhite;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: padding,
        width: double.infinity,
        height: NfcDimens.md,
        decoration:
            BoxDecoration(color: _backgroundButton, borderRadius: BorderRadius.all(Radius.circular(NfcDimens.nano))),
        child: MaterialButton(onPressed: onTap, child: Text(label)));
  }
}
