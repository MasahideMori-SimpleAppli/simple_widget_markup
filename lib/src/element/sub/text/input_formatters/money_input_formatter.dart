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
    final formatter = NumberFormat('#,###');
    String newFormattedText = "";
    if (newText.contains(".")) {
      // 必要な場合、小数点未満の部分と整数部分を分離
      final List<String> splitNum = newText.split(".");
      // 整数部を３桁区切りでフォーマット
      final double value = double.parse(splitNum[0]);
      newFormattedText = formatter.format(value);
      // 残りの部分はフォーマットせずに追加する。
      newFormattedText += ".";
      splitNum.removeAt(0);
      for (String i in splitNum) {
        newFormattedText += i;
      }
    } else {
      // そのまま3桁区切りのフォーマットを適用
      final double value = double.parse(newText);
      newFormattedText = formatter.format(value);
    }
    return newValue.copyWith(
      text: newFormattedText,
      selection: TextSelection.collapsed(offset: newFormattedText.length),
    );
  }
}
