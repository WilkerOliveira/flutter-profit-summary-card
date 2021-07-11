import 'dart:io';

import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

extension DoubleExtensions on double {
  String formatToCurrency({int fractionDigits = 2}) {
    return toCurrencyString(
      this.toString(),
      thousandSeparator: Platform.localeName.contains("BR")
          ? ThousandSeparator.Period
          : ThousandSeparator.Comma,
      mantissaLength: fractionDigits,
    );
  }
}
