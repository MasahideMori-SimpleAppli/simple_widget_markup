///
/// Author Masahide Mori
///
/// First edition creation date 2023-05-06 16:38:39
///

import '../../simple_widget_markup.dart';

enum EnumSwitchBtnType { normal, check }

extension EXTEnumSwitchBtnType on EnumSwitchBtnType {
  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumSwitchBtnType fromStr(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    if (s == EnumSwitchBtnType.normal.name) {
      return EnumSwitchBtnType.normal;
    } else if (s == EnumSwitchBtnType.check.name) {
      return EnumSwitchBtnType.check;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd, info);
    }
  }
}
