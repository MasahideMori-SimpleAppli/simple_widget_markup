import '../element_params/spwml_info.dart';
import '../spwml_exception.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2023-02-05 20:40:02
///
enum EnumClipType { none, oval, rRect }

extension EXTEnumClipType on EnumClipType {
  /// Convert string name.
  String toStr() {
    return toString().split('.').last;
  }

  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumClipType fromStr(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    if (s == EnumClipType.none.toStr()) {
      return EnumClipType.none;
    } else if (s == EnumClipType.oval.toStr()) {
      return EnumClipType.oval;
    } else if (s == EnumClipType.rRect.toStr()) {
      return EnumClipType.rRect;
    } else {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd, info);
    }
  }
}
