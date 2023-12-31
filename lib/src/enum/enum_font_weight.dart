import 'dart:ui';

import '../../simple_widget_markup.dart';

///
/// (en) Definition of Font weight.
///
/// (ja) Font weightの定義です。
///
enum EnumFontWeight {
  w100,
  w200,
  w300,
  w400,
  w500,
  w600,
  w700,
  w800,
  w900,
  thin,
  light,
  normal,
  regular,
  medium,
  bold,
  black
}

/// EnumFontWeight extension.
extension EXTEnumFontWeight on EnumFontWeight {
  /// Convert flutter Object.
  ///
  /// * [lineStart] : SpWML line start.
  /// * [lineEnd] : SpWML line end.
  /// * [info] : SPWML information.
  ///
  /// Throws [SpWMLException] : If the parameter value is incorrect,
  ///
  /// Throws [Exception] : param value exception.
  FontWeight toObj(int lineStart, int lineEnd, SpWMLInfo? info) {
    if (this == EnumFontWeight.w100 || this == EnumFontWeight.thin) {
      return FontWeight.w100;
    } else if (this == EnumFontWeight.w200) {
      return FontWeight.w200;
    } else if (this == EnumFontWeight.w300 || this == EnumFontWeight.light) {
      return FontWeight.w300;
    } else if (this == EnumFontWeight.w400 ||
        this == EnumFontWeight.normal ||
        this == EnumFontWeight.regular) {
      return FontWeight.w400;
    } else if (this == EnumFontWeight.w500 || this == EnumFontWeight.medium) {
      return FontWeight.w500;
    } else if (this == EnumFontWeight.w600) {
      return FontWeight.w600;
    } else if (this == EnumFontWeight.w700 || this == EnumFontWeight.bold) {
      return FontWeight.w700;
    } else if (this == EnumFontWeight.w800) {
      return FontWeight.w800;
    } else if (this == EnumFontWeight.w900 || this == EnumFontWeight.black) {
      return FontWeight.w900;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.paramValueException, lineStart, lineEnd, info);
    }
  }

  /// * [v] : The string value of font weight.
  static FontWeight toObjFromStr(String v) {
    if (v == "100" ||
        v == EnumFontWeight.w100.name ||
        v == EnumFontWeight.thin.name) {
      return FontWeight.w100;
    } else if (v == "200" || v == EnumFontWeight.w200.name) {
      return FontWeight.w200;
    } else if (v == "300" ||
        v == EnumFontWeight.w300.name ||
        v == EnumFontWeight.light.name) {
      return FontWeight.w300;
    } else if (v == "400" ||
        v == EnumFontWeight.w400.name ||
        v == EnumFontWeight.normal.name ||
        v == EnumFontWeight.regular.name) {
      return FontWeight.w400;
    } else if (v == "500" ||
        v == EnumFontWeight.w500.name ||
        v == EnumFontWeight.medium.name) {
      return FontWeight.w500;
    } else if (v == "600" || v == EnumFontWeight.w600.name) {
      return FontWeight.w600;
    } else if (v == "700" ||
        v == EnumFontWeight.w700.name ||
        v == EnumFontWeight.bold.name) {
      return FontWeight.w700;
    } else if (v == "800" || v == EnumFontWeight.w800.name) {
      return FontWeight.w800;
    } else if (v == "900" ||
        v == EnumFontWeight.w900.name ||
        v == EnumFontWeight.black.name) {
      return FontWeight.w900;
    } else {
      throw Exception();
    }
  }
}
