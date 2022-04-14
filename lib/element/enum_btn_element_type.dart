import '../spwml_exception.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2022-02-09 20:27:34
///
enum EnumBtnElementType {
  text,
  outlined,
  elevated,
  icon,
  block
}

extension EXTEnumBtnElementType on EnumBtnElementType {
  String toStr() {
    return toString().split('.').last;
  }

  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumBtnElementType fromStr(String s, int lineStart, int lineEnd) {
    if (s == EnumBtnElementType.text.toStr()) {
      return EnumBtnElementType.text;
    } else if (s == EnumBtnElementType.outlined.toStr()) {
      return EnumBtnElementType.outlined;
    } else if (s == EnumBtnElementType.elevated.toStr()) {
      return EnumBtnElementType.elevated;
    } else if (s == EnumBtnElementType.icon.toStr()) {
      return EnumBtnElementType.icon;
    } else if (s == EnumBtnElementType.block.toStr()) {
      return EnumBtnElementType.block;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd);
    }
  }
}
