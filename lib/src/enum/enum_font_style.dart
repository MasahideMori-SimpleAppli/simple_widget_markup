import 'dart:ui';

import '../../simple_widget_markup.dart';

///
/// (en) Definition of Font style.
///
/// (ja) Font styleの定義です。
///
enum EnumFontStyle { normal, italic }

/// EnumFontStyle extension.
extension EXTEnumFontStyle on EnumFontStyle {
  /// Convert flutter Object.
  /// * [lineStart] : SpWML line start.
  /// * [lineEnd] : SpWML line end.
  /// * [info] : SPWML information.
  ///
  /// Throws [SpWMLException] : If the parameter value is incorrect,
  ///
  /// Throws [Exception] : param value exception.
  FontStyle toObj(int lineStart, int lineEnd, SpWMLInfo? info) {
    if (this == EnumFontStyle.normal) {
      return FontStyle.normal;
    } else if (this == EnumFontStyle.italic) {
      return FontStyle.italic;
    } else {
      throw SpWMLException(
        EnumSpWMLExceptionType.paramValueException,
        lineStart,
        lineEnd,
        info,
      );
    }
  }

  /// * [v] : The string value of font style.
  static FontStyle toObjFromStr(String v) {
    if (v == EnumFontStyle.normal.name) {
      return FontStyle.normal;
    } else if (v == EnumFontStyle.italic.name) {
      return FontStyle.italic;
    } else {
      throw Exception();
    }
  }
}
