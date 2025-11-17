import 'package:flutter/services.dart';
import 'package:simple_widget_markup/src/element/sub/text/input_formatters/util_input_formatter.dart';

/// (en) A formatter for entering monetary amounts
/// that automatically inserts commas to separate thousands.
/// The decimal_input_formatter and money_input_formatter must be applied first.
///
/// (ja) 三桁区切りでカンマが自動入力される、金額の入力のためのフォーマッター。
/// decimal_input_formatterやmoney_input_formatterは先に適用する必要があります。
class MoneyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // カーソルの現在位置を取得
    int selectionIndex = newValue.selection.baseOffset;

    // 変更後のテキストからカンマを除去
    String newText = newValue.text.replaceAll(',', '');

    // マイナス記号があれば一時的に削除。
    bool minusFlag = false;
    if (newText.startsWith("-")) {
      newText = newText.replaceAll('-', '');
      minusFlag = true;
    }

    String newFormattedText = "";

    if (newText.contains(".")) {
      if (newText == ".") {
        newFormattedText = "0.0";
      } else {
        // . でスタートする場合の例外処理
        if (newText.startsWith(".")) {
          newText = "0$newText";
          selectionIndex += 1;
        }
        final List<String> splitNum = newText.split(".");
        newFormattedText = "${_commaFormat(splitNum[0])}.";
        newFormattedText += splitNum.sublist(1).join("");
      }
    } else {
      newFormattedText = _commaFormat(newText);
    }

    // - 記号で始まる場合の例外処理。
    if (minusFlag) {
      newFormattedText = "-$newFormattedText";
    }

    // カーソル位置をカンマの増減に応じて変更。
    String preIndexBeforeText = UtilInputFormatter.getIndexBeforeString(
      oldValue.text,
      selectionIndex,
    );
    final int preRangeCommaNum = preIndexBeforeText.split(",").length - 1;
    String newIndexBeforeText = UtilInputFormatter.getIndexBeforeString(
      newFormattedText,
      selectionIndex,
    );
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

  /// 三桁区切りでカンマを挿入する関数。
  /// 通常のNumberFormatは浮動小数点誤差が発生するため回避策として導入。
  String _commaFormat(String t) {
    final List<String> revT = t.split('').reversed.toList();
    final buf = StringBuffer();
    for (int i = 0; i < revT.length; i++) {
      buf.write(revT[i]);
      if ((i + 1) % 3 == 0 && i != revT.length - 1) {
        buf.write(',');
      }
    }
    return buf.toString().split('').reversed.join("");
  }
}
