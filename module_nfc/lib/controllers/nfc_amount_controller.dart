import 'dart:io';

import 'package:module_external_dependencies/extended_masked_text.dart';
import 'package:intl/intl.dart';
import 'package:module_commons/commons.dart';

class FoxBitPayMaskController extends MoneyMaskedTextController {
  final double? initialValue;

  FoxBitPayMaskController({this.initialValue, String? leftSymbol})
      : super(
      initialValue: initialValue,
      leftSymbol: " ",
      thousandSeparator: NumberFormat.simpleCurrency(locale: Platform.localeName).symbols.GROUP_SEP,
      decimalSeparator: NumberFormat.simpleCurrency(locale: Platform.localeName).symbols.DECIMAL_SEP);
}