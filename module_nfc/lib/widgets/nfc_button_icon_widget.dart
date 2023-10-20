import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:module_assets/vectors/nfc_app_vector.dart';
import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/flutter_svg.dart';

class NfcNumberIconWidget extends StatelessWidget {
  final Function() onTapButton;
  final IconData icon;

  const NfcNumberIconWidget({Key? key, required this.onTapButton, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              onTapButton.call();
              HapticFeedback.lightImpact();
            },
            child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(NfcDimens.nano)),
                    border:
                        Border.fromBorderSide(BorderSide(width: NfcDimens.femto, color: NfcColors.neutralGraySeven)),
                    shape: BoxShape.rectangle,
                    color: NfcColors.megaMenuButton),
                child: Center(child: Icon(icon, color: NfcColors.monoWhite, size: NfcDimens.xlhmacro)))));
  }
}
