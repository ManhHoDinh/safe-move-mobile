import 'package:flutter/services.dart';

class MinMaxFormatter extends TextInputFormatter {
  MinMaxFormatter(this.minValue);
  final int minValue;
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final parsed = int.tryParse(newValue.text);
    if (parsed == null) {
      return TextEditingValue.empty;
    }

    if (parsed < minValue) {
      return TextEditingValue.empty;
    }
    return newValue;
  }
}
