import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';

class NfcFABWidget extends StatelessWidget {
  final Function() onTap;

  const NfcFABWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor: NfcColors.neutralGraySix,
      child: Icon(Icons.add),
      elevation: 10,
    );
  }
}
