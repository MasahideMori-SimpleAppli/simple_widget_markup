import 'package:flutter/services.dart';
import 'package:simple_widget_markup/src/element/sub/text/input_formatters/util_input_formatter.dart';

/// (en) A formatter to ensure that if there is a minus sign,
/// there is always only one at the beginning.
///
/// (ja) マイナス記号がある場合、常に先頭に１つだけにするためのフォーマッター。
class MinusInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    // マイナス記号がある場合のみ操作する。
    if (newValue.text == "-") {
      // マイナス記号のみの場合はそのまま
      return newValue;
    } else if (newValue.text.contains("-")) {
      final int minusNum = newValue.text.split("-").length - 1;
      if (minusNum == 1) {
        // 選択位置は変えずに整形する。
        final String newFormattedText = "-${newValue.text.replaceAll("-", "")}";
        return TextEditingValue(
          text: newFormattedText,
          selection: newValue.selection,
        );
      } else {
        // カーソルの現在位置を取得
        int selectionIndex = newValue.selection.baseOffset;
        final String newFormattedText = "-${newValue.text.replaceAll("-", "")}";
        // カーソル位置までのマイナス記号の数-1個分、カーソル位置を変える。
        // カーソル位置をマイナス記号の増減に応じて変更。
        String preIndexBeforeText = UtilInputFormatter.getIndexBeforeString(
          oldValue.text,
          selectionIndex,
        );
        final int preRangeMinusNum = preIndexBeforeText.split("-").length - 1;
        selectionIndex -= (preRangeMinusNum - 1);
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
    } else {
      return newValue;
    }
  }
}
