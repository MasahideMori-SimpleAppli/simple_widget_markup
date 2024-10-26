import 'package:flutter/services.dart';

/// (en) A formatter for setting maximum and minimum values when
/// entering numbers.
///
/// (ja) 数値入力時の最大値と最小値を設定するためのフォーマッター。
class ValueRangeFormatter extends TextInputFormatter {
  final double? minV;
  final double? maxV;

  ValueRangeFormatter(this.minV, this.maxV);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // 無効な場合はそのまま返す。
    if (minV == null && maxV == null) {
      return newValue;
    }

    // 変更後のテキストからカンマを除去
    String newText = newValue.text.replaceAll(',', '');

    // 変更後のテキストが数字に変換できる場合のみ動作する。
    double? convertedNum = double.tryParse(newText);
    if (convertedNum == null) {
      return newValue;
    }
    if (minV != null) {
      if (convertedNum < minV!) {
        convertedNum = minV!;
        newText = convertedNum.toString();
        return TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(offset: newText.length),
        );
      }
    }
    if (maxV != null) {
      if (convertedNum > maxV!) {
        convertedNum = maxV!;
        newText = convertedNum.toString();
        return TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(offset: newText.length),
        );
      }
    }
    return newValue;
  }
}
