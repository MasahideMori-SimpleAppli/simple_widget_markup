import 'package:flutter/services.dart';

/// (en) A formatter for decimal input that always formats to have only one dot.
///
/// (ja) 常に１つだけのドットになるように整形される、小数点入力のためのフォーマッター。
class DecimalInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    // ドットが２つ以上ある場合のみ操作する。
    if (newValue.text.split(".").length > 2) {
      final int targetIndex = _findAddedCharacter(oldValue.text, newValue.text);
      if (targetIndex == -1 || newValue.text.split(".").length != 3) {
        // 追加位置が分からない場合（貼り付けなど）は最後の１つだけを有効化する。
        List<String> dotSplit = newValue.text.split(".").toList();
        String lastStr = dotSplit.removeLast();
        String newFormattedText = "${dotSplit.join("")}.$lastStr";
        // カーソル位置は最後に調整。
        return TextEditingValue(
          text: newFormattedText,
          selection: TextSelection.collapsed(offset: newFormattedText.length),
        );
      } else {
        // 古い方のドットを無視して連結する。
        final buf = StringBuffer();
        final List<String> newTList = newValue.text.split('').toList();
        int removeDotIndex = -1;
        for (int i = 0; i < newTList.length; i++) {
          if (newTList[i] == ".") {
            // 新しい方のドットのみを入力する。
            if (i == targetIndex) {
              buf.write(newTList[i]);
            } else {
              removeDotIndex = i;
            }
          } else {
            buf.write(newTList[i]);
          }
        }
        // カーソルの現在位置を取得
        int selectionIndex = newValue.selection.baseOffset;
        if (removeDotIndex < selectionIndex) {
          selectionIndex -= 1;
        }
        final String newFormattedText = buf.toString();
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

  /// 追加された文字のインデックスを返す関数。
  int _findAddedCharacter(String preText, String newText) {
    if (newText.length != preText.length + 1) {
      return -1;
    }
    // 文字列を比較し、異なる最初の文字のインデックスを取得
    int diffIndex = newText.length;
    final List<String> preTList = preText.split('').toList();
    final List<String> newTList = newText.split('').toList();
    for (int i = 0; i < preTList.length; i++) {
      if (preTList[i] != newTList[i]) {
        diffIndex = i;
        break;
      }
    }
    return diffIndex;
  }
}
