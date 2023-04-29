import 'dart:ui';

import '../../simple_widget_markup.dart';

enum EnumTextDecorationStyle { solid, dotted, dashed, double, wavy }

extension EXTEnumTextDecorationStyle on EnumTextDecorationStyle {
  /// Convert flutter Object.
  /// * [lineStart] : SpWML line start.
  /// * [lineEnd] : SpWML line end.
  /// * [info] : SPWML information.
  ///
  /// Throws [SpWMLException] : If the parameter value is incorrect,
  ///
  /// Throws [Exception] : param value exception.
  TextDecorationStyle toObj(int lineStart, int lineEnd, SpWMLInfo? info) {
    if (this == EnumTextDecorationStyle.solid) {
      return TextDecorationStyle.solid;
    } else if (this == EnumTextDecorationStyle.dotted) {
      return TextDecorationStyle.dotted;
    } else if (this == EnumTextDecorationStyle.dashed) {
      return TextDecorationStyle.dashed;
    } else if (this == EnumTextDecorationStyle.double) {
      return TextDecorationStyle.double;
    } else if (this == EnumTextDecorationStyle.wavy) {
      return TextDecorationStyle.wavy;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.paramValueException, lineStart, lineEnd, info);
    }
  }

  /// * [v] : The string value of text decoration style.
  static TextDecorationStyle toObjFromStr(String v) {
    if (v == EnumTextDecorationStyle.solid.name) {
      return TextDecorationStyle.solid;
    } else if (v == EnumTextDecorationStyle.dotted.name) {
      return TextDecorationStyle.dotted;
    } else if (v == EnumTextDecorationStyle.dashed.name) {
      return TextDecorationStyle.dashed;
    } else if (v == EnumTextDecorationStyle.double.name) {
      return TextDecorationStyle.double;
    } else if (v == EnumTextDecorationStyle.wavy.name) {
      return TextDecorationStyle.wavy;
    } else {
      throw Exception();
    }
  }
}
