import 'package:intl/intl.dart';

class NumberFormater {
  static formarToCompactNumber(int number) {
    final numberFormated =
        NumberFormat.compactCurrency(decimalDigits: 0, symbol: "")
            .format(number);
    return numberFormated;
  }
}
