import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

/// (en) A formatter for entering monetary amounts
/// that automatically inserts commas to separate thousands.
///
/// (ja) 三桁区切りでカンマが自動入力される、金額の入力のためのフォーマッター。
class MoneyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    String newText = newValue.text.replaceAll(',', '');
    double value = double.parse(newText);
    // 3桁区切りのフォーマットを適用
    final formatter = NumberFormat('#,###');
    String newFormattedText = formatter.format(value);
    return newValue.copyWith(
      text: newFormattedText,
      selection: TextSelection.collapsed(offset: newFormattedText.length),
    );
  }
}
