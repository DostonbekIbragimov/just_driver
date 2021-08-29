// ignore: import_of_legacy_library_into_null_safe
import 'package:money_formatter/money_formatter.dart';

class BaseFunctions {
  static String numberWithZero(String number) {
    if (number.substring(0, 1) == '0')
      return number;
    else if (number.length == 1) return "0$number";
    return number;
  }

  static String moneyFormatWithSymbol(double sum) {
    var amount = MoneyFormatter(
      amount: sum,
      settings: MoneyFormatterSettings(thousandSeparator: " "),
    ).output.symbolOnLeft;
    return amount.substring(0, amount.length - 3);
  }

  static String moneyFormat(double sum) {
    var amount = MoneyFormatter(
      amount: sum,
      settings: MoneyFormatterSettings(thousandSeparator: " "),
    ).output.withoutFractionDigits;
    return amount.replaceAll('.00', '');
  }
}
