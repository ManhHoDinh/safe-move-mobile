import 'package:intl/intl.dart';

String formatMoney(int money) {
  return NumberFormat.decimalPattern().format(money);
}
