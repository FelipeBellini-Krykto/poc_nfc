import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/flutter_modular.dart';

class NfcAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final EdgeInsetsGeometry padding;
  final double preferredSizeHeight;
  final double height;
  final String title;

  const NfcAppBarWidget({
    Key? key,
    this.padding = EdgeInsets.zero,
    this.preferredSizeHeight = NfcDimens.lg,
    this.height = NfcDimens.md,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        left: false,
        right: false,
        top: true,
        child: Container(
            margin: const EdgeInsets.only(
                top: NfcDimens.xxxs, right: NfcDimens.xxxs, left: NfcDimens.xxxs, bottom: NfcDimens.nano),
            height: height,
            padding: padding,
            alignment: Alignment.topCenter,
            child: Row(children: [
              GestureDetector(
                  onTapDown: (_) {
                    HapticFeedback.lightImpact();
                    Modular.to.pop();
                  },
                  child: Stack(alignment: Alignment.center, children: [
                    Container(
                        height: NfcDimens.xlhmacro,
                        width: NfcDimens.xlhmacro,
                        decoration: BoxDecoration(
                            color: NfcColors.megaMenuButton,
                            borderRadius: BorderRadius.all(Radius.circular(NfcDimens.xlhmacro)))),
                    Icon(Icons.arrow_back, color: NfcColors.monoWhite, size: NfcDimens.xxs)
                  ])),
              Padding(
                  padding: EdgeInsets.only(left: NfcDimens.xxxs),
                  child: Text(title,
                      style: TextStyle(
                          fontSize: NfcDimens.xxxmacro, fontWeight: FontWeight.w600, color: NfcColors.monoWhite)))
            ])));
  }

  @override
  Size get preferredSize => Size.fromHeight(preferredSizeHeight);
}
