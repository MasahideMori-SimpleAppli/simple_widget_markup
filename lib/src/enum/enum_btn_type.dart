import '../element_params/spwml_info.dart';
import '../spwml_exception.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-02-09 20:27:34
///
enum EnumBtnType { text, outlined, elevated, icon, block }

extension EXTEnumBtnType on EnumBtnType {
  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumBtnType fromStr(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    if (s == EnumBtnType.text.name) {
      return EnumBtnType.text;
    } else if (s == EnumBtnType.outlined.name) {
      return EnumBtnType.outlined;
    } else if (s == EnumBtnType.elevated.name) {
      return EnumBtnType.elevated;
    } else if (s == EnumBtnType.icon.name) {
      return EnumBtnType.icon;
    } else if (s == EnumBtnType.block.name) {
      return EnumBtnType.block;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd, info);
    }
  }
}
