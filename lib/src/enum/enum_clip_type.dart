import '../element_params/spwml_info.dart';
import '../spwml_exception.dart';

///
/// Author Masahide Mori
///
/// First edition creation date 2023-02-05 20:40:02
///
enum EnumClipType { none, oval, rRect }

extension EXTEnumClipType on EnumClipType {
  /// Throws [SpWMLException] : If the type is incorrect, Throws TypeException.
  static EnumClipType fromStr(
      String s, int lineStart, int lineEnd, SpWMLInfo? info) {
    try {
      return EnumClipType.values.byName(s);
    } catch (e) {
      throw SpWMLException(
          EnumSpWMLExceptionType.typeException, lineStart, lineEnd, info);
    }
  }
}
