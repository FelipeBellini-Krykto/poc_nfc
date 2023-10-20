import 'dart:math';
import 'package:module_external_dependencies/intl.dart';

extension moneyFormat on String? {
  String foxbitWalletMoneyMask({int decimalDigits = 2}) {
    return double.parse(this ?? "0").foxbitWalletMoneyMask(decimalDigits: decimalDigits);
  }
}

extension money on double? {
  String foxbitWalletMoneyMask({int decimalDigits = 2}) =>
      NumberFormat.simpleCurrency(decimalDigits: decimalDigits)
          .format(this?.foxbitWalletTruncateToDouble(decimalDigits) ?? 0);
}

extension truncateDouble on double {
  double foxbitWalletTruncateToDouble(int precision) {
    final mod = pow(10.0, precision);
    return (((this.abs() * mod).floor()) / mod);
  }
}
