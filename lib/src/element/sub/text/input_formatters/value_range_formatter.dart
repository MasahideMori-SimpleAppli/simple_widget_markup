import 'package:flutter/services.dart';
import 'package:simple_widget_markup/src/element/sub/text/input_formatters/util_input_formatter.dart';

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

    // カーソルの現在位置を取得
    int selectionIndex = newValue.selection.baseOffset;

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
      }
    }

    if (maxV != null) {
      if (convertedNum > maxV!) {
        convertedNum = maxV!;
      }
    }

    String newFormattedText = convertedNum.toString();

    // カーソル位置をカンマの増減に応じて変更。
    String preIndexBeforeText =
        UtilInputFormatter.getIndexBeforeString(oldValue.text, selectionIndex);
    final int preRangeCommaNum = preIndexBeforeText.split(",").length - 1;
    String newIndexBeforeText = UtilInputFormatter.getIndexBeforeString(
        newFormattedText, selectionIndex);
    final int newRangeCommaNum = newIndexBeforeText.split(",").length - 1;
    if (oldValue.text.length < newValue.text.length) {
      final int shift = preRangeCommaNum - newRangeCommaNum;
      if (shift < 0) {
        selectionIndex -= (preRangeCommaNum - newRangeCommaNum);
      }
    } else {
      selectionIndex -= (preRangeCommaNum - newRangeCommaNum);
    }

    // カーソル位置を新しいテキストの範囲内に制限
    if (selectionIndex < 0) {
      selectionIndex = 0;
    }
    if (selectionIndex > newFormattedText.length) {
      selectionIndex = newFormattedText.length;
    }

    return TextEditingValue(
      text: newFormattedText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
