import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';

class NfcNumberButtonWidget extends StatelessWidget {
  final String value;
  final Function(String) onTapButton;

  const NfcNumberButtonWidget({Key? key, required this.value, required this.onTapButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => onTapButton.call(value),
            child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(NfcDimens.nano)),
                    border: Border.fromBorderSide(BorderSide(width: 4, color: NfcColors.neutralGraySeven)),
                    shape: BoxShape.rectangle,
                    color: NfcColors.megaMenuButton),
                child: Center(
                    child: Text(value.toString(),
                        style:
                            TextStyle(fontSize: NfcDimens.xxs, color: Colors.white, fontWeight: FontWeight.w600))))));
  }
}
