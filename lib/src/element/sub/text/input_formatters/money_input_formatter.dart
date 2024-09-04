import 'package:flutter/services.dart';

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

    // カーソルの現在位置を取得
    int selectionIndex = newValue.selection.baseOffset;

    // 変更後のテキストからカンマを除去
    String newText = newValue.text.replaceAll(',', '');

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

    // カーソル位置をカンマの増減に応じて変更。
    String preIndexBeforeText =
        _getIndexBeforeString(oldValue.text, selectionIndex);
    final int preRangeCommaNum = preIndexBeforeText.split(",").length - 1;
    String newIndexBeforeText =
        _getIndexBeforeString(newFormattedText, selectionIndex);
    final int newRangeCommaNum = newIndexBeforeText.split(",").length - 1;
    selectionIndex -= (preRangeCommaNum - newRangeCommaNum);

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

  /// 指定されたインデックスまでのテキストを取得する関数。
  String _getIndexBeforeString(String t, int index) {
    final List<String> sList = t.split('').toList();
    final buf = StringBuffer();
    for (int i = 0; i < sList.length; i++) {
      buf.write(sList[i]);
      if (i == index) {
        break;
      }
    }
    return buf.toString();
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
