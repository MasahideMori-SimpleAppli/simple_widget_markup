import '../spwml_exception.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-02-09 20:27:34
///
enum EnumBtnType { text, outlined, elevated, icon, block }

extension EXTEnumBtnType on EnumBtnType {
  /// Convert string name.
  String toStr() {
    return toString().split('.').last;
  }

  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumBtnType fromStr(String s, int lineStart, int lineEnd) {
    if (s == EnumBtnType.text.toStr()) {
      return EnumBtnType.text;
    } else if (s == EnumBtnType.outlined.toStr()) {
      return EnumBtnType.outlined;
    } else if (s == EnumBtnType.elevated.toStr()) {
      return EnumBtnType.elevated;
    } else if (s == EnumBtnType.icon.toStr()) {
      return EnumBtnType.icon;
    } else if (s == EnumBtnType.block.toStr()) {
      return EnumBtnType.block;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd);
    }
  }
}
