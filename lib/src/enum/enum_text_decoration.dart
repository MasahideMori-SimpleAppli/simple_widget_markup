import 'dart:ui';

import 'package:simple_widget_markup/simple_widget_markup.dart';

/// (en) Definitions of text decorations available in SpWML.
///
/// (ja) SpWMLで利用可能なテキストデコレーションの定義。
enum EnumTextDecoration { none, underline, overline, lineThrough }

/// EnumTextDecoration extension.
extension EXTEnumTextDecoration on EnumTextDecoration {
  /// Convert flutter Object.
  /// * [lineStart] : SpWML line start.
  /// * [lineEnd] : SpWML line end.
  /// * [info] : SPWML information.
  ///
  /// Throws [SpWMLException] : If the parameter value is incorrect,
  ///
  /// Throws [Exception] : param value exception.
  TextDecoration toObj(int lineStart, int lineEnd, SpWMLInfo? info) {
    if (this == EnumTextDecoration.none) {
      return TextDecoration.none;
    } else if (this == EnumTextDecoration.underline) {
      return TextDecoration.underline;
    } else if (this == EnumTextDecoration.overline) {
      return TextDecoration.overline;
    } else if (this == EnumTextDecoration.lineThrough) {
      return TextDecoration.lineThrough;
    } else {
      throw SpWMLException(
        EnumSpWMLExceptionType.paramValueException,
        lineStart,
        lineEnd,
        info,
      );
    }
  }

  /// * [v] : The string value of text decoration.
  static TextDecoration toObjFromStr(String v) {
    if (v == EnumTextDecoration.none.name) {
      return TextDecoration.none;
    } else if (v == EnumTextDecoration.underline.name) {
      return TextDecoration.underline;
    } else if (v == EnumTextDecoration.overline.name) {
      return TextDecoration.overline;
    } else if (v == EnumTextDecoration.lineThrough.name) {
      return TextDecoration.lineThrough;
    } else {
      throw Exception();
    }
  }
}
